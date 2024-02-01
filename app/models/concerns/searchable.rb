module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      # mapping definition goes here
      indexes :name, type: :text
      indexes :body, type: :text
    end

    def self.search(query)
      self.__elasticsearch__.search(query)
      # build and run search
    end
  end
end