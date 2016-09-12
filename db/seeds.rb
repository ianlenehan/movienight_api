# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Group.destroy_all
g1 = Group.create :group_name => 'Balmain Movie Night'

User.destroy_all
me = User.create(:name_first => 'Ian', :name_last => 'Lenehan', :email => 'ianlenehan@gmail.com', :password => '123456', :password_confirmation => '123456', groups: Group.where(group_name: 'Balmain Movie Night'))

15.times do |n|
  User.create :name_first => Faker::Name.first_name, :name_last => Faker::Name.last_name, :email => Faker::Internet.email, :password => '123456', :password_confirmation => '123456'
end
