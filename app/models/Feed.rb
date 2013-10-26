class Feed
  include Mongoid::Document
  include Mongoid::Timestamps
  field :site_name, type: String
  field :url, type: String

  has_many :entries, autosave: true, dependent: :delete
end