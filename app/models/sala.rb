class Sala < ApplicationRecord
	has_many :turmas
	audited
	def salabloco
		"#{bloco}#{numSala}"
	end
	def maxpessoas
		"#{capacidade} Pessoas"
	end
end
