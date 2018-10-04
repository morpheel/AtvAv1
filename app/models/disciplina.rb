class Disciplina < ApplicationRecord
  belongs_to :professor

  def ch
  	"#{cargaHoraria} Horas"
  end
end
