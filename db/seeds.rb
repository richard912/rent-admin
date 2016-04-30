# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Agent.create email: 'admin@rent.us', password: 'dir123123', password_confirmation: 'dir123123'

User.create first_name: 'Jone Doe', last_name: 'Doe', email: 'johnd@gmail.com', fb_id: '/u/johnd', state: 'New York', status: 'Active', country: 'USA', username: 'Johnd20'
User.create first_name: 'Jone Doe', last_name: 'Doe', email: 'johnd@gmail.com', fb_id: '/u/johnd', state: 'New York', status: 'Active', country: 'USA', username: 'Johnd20'
User.create first_name: 'Jone Doe', last_name: 'Doe', email: 'johnd@gmail.com', fb_id: '/u/johnd', state: 'New York', status: 'Active', country: 'USA', username: 'Johnd20'
User.create first_name: 'Jone Doe', last_name: 'Doe', email: 'johnd@gmail.com', fb_id: '/u/johnd', state: 'New York', status: 'Inactive', country: 'USA', username: 'Johnd20'