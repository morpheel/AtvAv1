class Hora < ApplicationRecord
	has_many :turmas

	def iniciofim
		"#{inicio.strftime("%I:%M %p")} - #{fim.strftime("%I:%M %p")}"
	end
end
