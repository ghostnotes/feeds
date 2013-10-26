require 'date'

class Entry
  include Mongoid::Document
  field :title, type: String
  field :url, type: String
  field :publish_datetime, type: String

  belongs_to :feed
end