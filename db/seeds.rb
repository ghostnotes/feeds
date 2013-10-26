require 'csv'

Feed.delete_all
Entry.delete_all

CSV.foreach('db/feeds.csv') do |row|
  Feed.create(site_name: row[0], site_url: row[1], feed_url: row[2])
end
