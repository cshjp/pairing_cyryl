require "recipe_directory"

RSpec.describe RecipeDirectory do
  def reset_recipes_table
    seed_sql = File.read("spec/seeds_recipe.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "recipes_directory_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_recipes_table
  end

  it "returns all recipes" do
    repo = RecipeDirectory.new

    recipes = repo.all

    expect(recipes.length).to eq 2 # =>  2

    expect(recipes[0].id).to eq 1 # =>  1
    expect(recipes[0].name).to eq "Bolognese" # =>  'Bolognese'
    expect(recipes[0].cooking_time).to eq 135 # =>  135
    expect(recipes[0].rating).to eq 5 # => 5

    expect(recipes[1].id).to eq 2 # =>  2
    expect(recipes[1].name).to eq "Carbonara" # =>  'Carbonara'
    expect(recipes[1].cooking_time).to eq 35 # =>  '35'
    expect(recipes[1].rating).to eq 4 # => 4
  end

  it "returns bolognese" do
    repo = RecipeDirectory.new

    recipes = repo.find(1)

    expect(recipes.id).to eq 1 # =>  1
    expect(recipes.name).to eq "Bolognese" # =>  'Bolognese'
    expect(recipes.cooking_time).to eq 135 # =>  135
    expect(recipes.rating).to eq 5 # => 5
  end
end
