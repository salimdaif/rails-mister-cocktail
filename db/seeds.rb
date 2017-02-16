require 'open-uri'
require 'json'

result = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)

result['drinks'].each do |result|
  Ingredient.create(name: result['strIngredient1'])
end
