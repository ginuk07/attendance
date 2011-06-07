# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Classification.create(:name => "reg_ed", :display_name => "Regular Education", :rate => 28.00)
Classification.create(:name => "spec_ed", :display_name => "Special Education", :rate => 35.00)
Classification.create(:name => "basic_bundled", :display_name => "Basic Bundled", :rate => 109.50)
Classification.create(:name => "basic_bundled_spec_ed", :display_name => "Basic Bundled Special Education", :rate => 116.50)
Classification.create(:name => "premium_bundled", :display_name => "Premium Bundled", :rate => 119.50)
Classification.create(:name => "premium_bundled_spec_ed", :display_name => "Premium Bundled Special Education", :rate => 126.50)
