class Hora < ApplicationRecord
	has_many :turmas
	audited
	def iniciofim
		"#{inicio.strftime("%I:%M %p")} - #{fim.strftime("%I:%M %p")}"
	end
end
