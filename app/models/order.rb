class Order < ApplicationRecord
  has_many :items
  has_many :products, through: :items
  has_one_attached :avatar
end