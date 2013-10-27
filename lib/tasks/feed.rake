require 'rss'
require 'date'

DEFAULT_MAX_FEED_ENTRY_LENGTH = 5

namespace :feed do
  task :gathering => :environment do
    Entry.delete_all

    Feed.each do |f|
      begin
        start_time = Time.now
        feed_entries = get_feed_entries(f.feed_url)
        feed_entries.items.each do |entry|
          f.entries << Entry.new(title: entry.title, url: entry.link, publish_datetime: entry.pubDate)
          f.save
        end

        puts "# Succeeded to get the feed data of #{f.site_name} in [ #{Time.now - start_time} sec ]."
      rescue => ex
        puts "## Failed to request to #{f.site_name} because of the unexpected error -> [ #{ex.message} ]"
        next
      end
    end
  end

  private

  def get_feed_entries(url)
    rss = RSS::Parser.parse(url)
    feed = rss.to_feed('rss2.0')

    if feed.items.length > DEFAULT_MAX_FEED_ENTRY_LENGTH
      feed.items.slice!(DEFAULT_MAX_FEED_ENTRY_LENGTH..feed.items.length - 1)
    end

    feed
  end

end
