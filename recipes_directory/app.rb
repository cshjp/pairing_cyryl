require_relative 'lib/database_connection'
require_relative 'lib/recipe_directory'

DatabaseConnection.connect('recipes_directory')

all_result = RecipeDirectory.new
find_result = RecipeDirectory.new

all_result.all.each do |recipe|
    p "#{recipe.name}: #{recipe.cooking_time} minutes, rating: #{recipe.rating}"
end

recipe = find_result.find(1)
p recipe.id
p recipe.name
p recipe.cooking_time
p recipe.rating