require './db/seeds/category.rb'
require "csv"
CSV.foreach('db/brand.csv') do |row|
  Brand.create(:id => row[0], :name => row[1])
end 