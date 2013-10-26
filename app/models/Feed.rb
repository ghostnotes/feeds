class Feed
  include Mongoid::Document
  include Mongoid::Timestamps
  field :site_name, type: String
  field :site_url, type: String
  field :feed_url, type: String

  has_many :entries, autosave: true, dependent: :delete, order: :publish_datetime.desc
end