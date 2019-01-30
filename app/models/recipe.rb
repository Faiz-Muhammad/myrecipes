class Recipe < ApplicationRecord
  validates_presence_of :name, length: { maximum: 30}
  validates_presence_of :description, length: {minimum: 5, maximum: 500}
  belongs_to :chef
  validates_presence_of :chef_id
end
