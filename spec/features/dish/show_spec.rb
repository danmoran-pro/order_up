require 'rails_helper'

describe "visit a dish's show page" do
    it "see the name of the chef that made that dish and ingredients" do 
        chef_1 = Chef.create(name: "Boyardee")
        dish_1 = chef_1.dishes.create(name:"Ravioli", description: "The timeless flavor everyone loves.")
        ingredient_1 = Ingredient.create!(name: "Pasta", calories: 750)
        ingredient_2 = Ingredient.create!(name: "Sauce", calories: 1000)
        dish_1.ingredient << ingredient_1
        dish_1.ingredient << ingredient_2

        visit dish_path(dish_1)

        expect(page).to have_content("Chef: Boyardee")
        expect(page).to have_content("Ingredient: Pasta")
        expect(page).to have_content("Ingredient: Sauce")
    end 

    it "sees total calories" do 
        chef_1 = Chef.create(name: "Boyardee")
        dish_1 = chef_1.dishes.create(name:"Ravioli", description: "The timeless flavor everyone loves.")
        ingredient_1 = Ingredient.create!(name: "Pasta", calories: 750)
        ingredient_2 = Ingredient.create!(name: "Sauce", calories: 1000)
        dish_1.ingredient << ingredient_1
        dish_1.ingredient << ingredient_2
        
        visit dish_path(dish_1)

        expect(page).to have_content("Total Calories: 1750")
    end 
 end 

