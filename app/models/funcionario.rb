class Funcionario < ApplicationRecord
	audited
	def sal
		"R$ #{'%.2f' % salario}"
	end
end
