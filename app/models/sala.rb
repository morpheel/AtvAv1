class Sala < ApplicationRecord
	has_many :turmas
	audited
	def salabloco
		"#{bloco}#{numSala}"
	end
end
