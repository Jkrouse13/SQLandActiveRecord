class Item < ApplicationRecord

  has_many :orders
  validates_presence_of :title, :category, :price
end
