class Sala < ApplicationRecord
	has_many :turmas

	def salabloco
		"#{bloco}#{numSala}"
	end
end
