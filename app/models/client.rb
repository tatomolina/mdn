class Client < ApplicationRecord
  validates :name, :presence => true
  has_many :orders
  resourcify

end
