class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredient, through: :dish_ingredients


  def total_cal
    ingredient.sum(:calories)
  end 
end
