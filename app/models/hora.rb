class Hora < ApplicationRecord
	has_many :turmas
	audited

end
