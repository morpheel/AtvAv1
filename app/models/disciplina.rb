class Disciplina < ApplicationRecord
  belongs_to :professor
  belongs_to :turma
  audited
  def ch
  	"#{cargaHoraria} Horas"
  end
end
