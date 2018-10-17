class Presenca < ApplicationRecord
  belongs_to :mat_disc
  belongs_to :frequenciaaluno
  attr_accessor :aluno_nome
end
