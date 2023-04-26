require_relative "recipe"

class RecipeDirectory
  def all
    recipes = []
    sql = "SELECT id, name, cooking_time, rating FROM recipes;"
    result = DatabaseConnection.exec_params(sql, [])

    result.each do |record|
      recipe = Recipe.new
      recipe.id = record["id"].to_i
      recipe.name = record["name"]
      recipe.cooking_time = record["cooking_time"].to_i
      recipe.rating = record["rating"].to_i
      recipes << recipe
    end
    recipes
  end

  def find(id)
    sql = "SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;"
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    record = result[0]

    recipe = Recipe.new
    recipe.id = record["id"].to_i
    recipe.name = record["name"]
    recipe.cooking_time = record["cooking_time"].to_i
    recipe.rating = record["rating"].to_i
    recipe
  end
end
