class Turma < ApplicationRecord
  belongs_to :sala
  belongs_to :hora
  has_many :disciplinas, inverse_of: :turma, dependent: :destroy
  accepts_nested_attributes_for :disciplinas, reject_if: :all_blank, allow_destroy: true
  audited
end
