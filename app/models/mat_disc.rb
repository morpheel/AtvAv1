class MatDisc < ApplicationRecord
  belongs_to :mat_turma
  belongs_to :disciplina
  attr_accessor :aluno_nome
  audited
end
