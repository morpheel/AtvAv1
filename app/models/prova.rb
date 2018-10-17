class Prova < ApplicationRecord
  belongs_to :avaliacao
  belongs_to :mat_disc
  attr_accessor :aluno_nome
end
