class Recipe < ApplicationRecord
  validates_presence_of :name, length: { maximum: 30}
  validates_presence_of :description, length: {minimum: 5, maximum: 500}
  belongs_to :chef
  validates_presence_of :chef_id
  default_scope -> {order(updated_at: :desc)} #latest recipe created will be on top
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
