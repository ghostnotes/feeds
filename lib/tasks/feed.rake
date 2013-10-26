require 'rss'
require 'date'

DEFAULT_MAX_FEED_ENTRY_LENGTH = 5

namespace :feed do
  task :gathering => :environment do
    Entry.delete_all

    Feed.each do |f|
      feed_entries = get_feed_entries(f.url)
      feed_entries.items.each do |entry|
        f.entries << Entry.new(title: entry.title, url: entry.link, publish_datetime: entry.pubDate)
        f.save
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
