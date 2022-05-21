# # USERS

users = [{
  :name => "TestUser",
  :email => "testuser@gmail.com",
  :password => "password",
  :password_confirmation => "password",
}]

users.each do |user|
  User.create(
    name: user[:name], email: user[:email],
    password: user[:password],
    password_confirmation: user[:password_confirmation],
    confirmed_at: DateTime.now
  )
end

foods = [
  {
    name: "Apple",
    measurement_unit: "g",
    price: 5,
    user_id: 1
  },
  {
    name: "Pineapple",
    measurement_unit: "g",
    price: 2,
    user_id: 1
  },
  {
    name: "Chicken breasts",
    measurement_unit: "units",
    price: 3,
    user_id: 1
  }
]

foods.each do |food|
  Food.create(
    name: food[:name],
    measurement_unit: food[:measurement_unit],
    price: food[:price],
    user_id: food[:user_id]
  )
end

description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
ed do eiusmod tempor incididunt ut labore et dolore magna
aliqua. Ut enim ad minim veniam, quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit
esse cillum dolore eu fugiat nulla pariatur.
"


recipes = [
  {
    name: "Recipe 1",
    preparation_time: 0.5,
    cooking_time: 1.4,
    description: description,
    public_recipe: false,
    user_id: 1
  },
  {
    name: "Recipe 2",
    preparation_time: 1.0,
    cooking_time: 2.0,
    description: description,
    public_recipe: false,
    user_id: 1
  }
]

recipes.each_with_index do |recipe, index|
  Recipe.create(
    name: recipe[:name],
    preparation_time: recipe[:preparation_time],
    cooking_time: recipe[:cooking_time],
    description: recipe[:description],
    public_recipe: recipe[:public_recipe],
    user_id: recipe[:user_id]
  )
end

(1..3).each do |index|
  RecipeFood.create(
    quantity: 2 * index,
    recipe_id: 1,
    food_id: index
  )
end

