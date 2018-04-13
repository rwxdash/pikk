require 'pikk'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/object/json'

class Fruit
  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end
end

fruits = []

fruits << mango   = Fruit.new("mango", 5).as_json.symbolize_keys
fruits << apple   = Fruit.new("apple", 3).as_json.symbolize_keys
fruits << cherry  = Fruit.new("cherry", 2).as_json.symbolize_keys
fruits << banana  = Fruit.new("banana", 1).as_json.symbolize_keys
fruits << melon   = Fruit.new("melon", 8).as_json.symbolize_keys
fruits << orange  = Fruit.new("orange", 6).as_json.symbolize_keys

puts
puts 'single select'
puts Pikk.single_select(fruits)

puts
puts 'pool select'
puts Pikk.pool(fruits, iteration: 10_000)

puts
puts 'pool select, table print'
puts Pikk.pool(fruits, iteration: 10_000, pp: true)
