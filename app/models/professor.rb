class Professor < ApplicationRecord
	has_many :disciplinas

	audited
end
