# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	Hora.create(turno: 'Manhã')
	Hora.create(turno: 'Tarde')
	Hora.create(turno: 'Noite')
	usuario = Usuario.create! :nome => 'Eliakim Meneses Sobreira Oliveira', :email => 'eliakim.meneses@gmail.com', :password => '123456', :password_confirmation => '123456', :login => 'eliakim'

