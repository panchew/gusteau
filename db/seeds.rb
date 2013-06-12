# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

#Tables
Table.create(:name => '1', :seats => 4, :status => 'Available')
Table.create(:name => '2', :seats => 6, :status => 'In Service')
Table.create(:name => '3', :seats => 4, :status => 'Available')
Table.create(:name => '4', :seats => 8, :status => 'Available')

#Products
Product.create(:name => 'Quesadillas', :description => 'Awesome quesadillas', :price => 10.25)
Product.create(:name => 'Coke', :description => 'Enjoy Coke', :price => 1.25)
Product.create(:name => 'Pasta', :description => 'Italian Style', :price => 12.00)
Product.create(:name => 'Calabaza', :description => 'Pumpkin', :price => 5.00)
