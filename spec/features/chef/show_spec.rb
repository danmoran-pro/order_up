require 'rails_helper'

describe "visit a chef's show page" do
    it "see the name of the chef that made that dish and ingredients link" do 
        chef_1 = Chef.create(name: "Boyardee")
        
        
        visit chef_path(chef_1)
        
        expect(page).to have_content("Chef: Boyardee")
        expect(page).to have_link("All Ingredient")
    end 

    it "can see all ingredients" do 
        ingredient_1 = Ingredient.create!(name: "Pasta", calories: 750)
        ingredient_2 = Ingredient.create!(name: "Sauce", calories: 1000)

        chef_1 = Chef.create(name: "Boyardee")
        
        
        visit chef_path(chef_1)

        click_link("All Ingredient")
        expect(current_path).to eq(ingredients_path)

        expect(page).to have_content(ingredient_1.name)
        expect(page).to have_content(ingredient_2.name)
    end 
end 







# s a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page 
# and I can s