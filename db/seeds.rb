# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	user = User.new
	user.username = "admin"
	user.email = "admin@admin.com"
	user.password = "test1234"
	user.skip_confirmation!
	user.add_role "admin"
	user.save
    roles = Role.create([{ name: 'agent' }, { name: 'customer' }])