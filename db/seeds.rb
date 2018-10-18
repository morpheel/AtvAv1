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
	professor = Professor.create :nome => 'Professor Teste', :email => 'professor@teste.com', :endereco => 'Rua Teste', :telefone => '99 9999 9999'
	funcionario = Funcionario.create :nome => 'Funcionario Teste', :telefone => '88 8888 8888', :endereco => 'Rua Teste 2', :salario => '2250.37'
	aluno1 = Aluno.create :nome => 'Aluno Teste 1', :dt_Nasc => '12/10/1995', :endereco => 'Rua Teste 3'
	aluno2 = Aluno.create :nome => 'Aluno Teste 2', :dt_Nasc => '10/10/1993', :endereco => 'Rua Teste 4'
	sala = Sala.create :numSala => '201', :bloco => 'A', :capacidade => '20'
	


