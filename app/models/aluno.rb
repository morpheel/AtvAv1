class Aluno < ApplicationRecord
	def dataNasc
		"#{dt_Nasc.strftime("%d / %m / %Y")}"
	end
end
