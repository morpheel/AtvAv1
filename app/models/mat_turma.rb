class MatTurma < ApplicationRecord
  belongs_to :aluno
  belongs_to :turma
  has_many :mat_discs, inverse_of: :mat_turma, dependent: :destroy
  accepts_nested_attributes_for :mat_discs, reject_if: :all_blank, allow_destroy: true
  audited
end
