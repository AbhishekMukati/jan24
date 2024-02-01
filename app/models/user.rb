class User < ApplicationRecord
  include Elasticsearch::Model
  # include Searchable


  validates :phone_number, phony_plausible: true

  before_validation :normalize_phone_number

  private

  def normalize_phone_number
    normalized_number = PhonyRails.normalize_number(phone_number, default_country_code: 'US')
    Rails.logger.info("Normalized Phone Number: #{normalized_number}")
    self.phone_number = normalized_number
  end
end
