require 'csv'

Feed.delete_all
Entry.delete_all

CSV.foreach('db/feeds.csv') do |row|
  Feed.create(site_name: row[0], url: row[1])
end
