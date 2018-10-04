class Turma < ApplicationRecord
  belongs_to :sala
  belongs_to :hora
end
