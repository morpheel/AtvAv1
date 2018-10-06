class Disciplina < ApplicationRecord
  belongs_to :professor
  belongs_to :turma

  def ch
  	"#{cargaHoraria} Horas"
  end
end
