class Avaliacao < ApplicationRecord
  belongs_to :disciplina
  has_many :provas, inverse_of: :avaliacao, dependent: :destroy
  accepts_nested_attributes_for :provas, reject_if: :all_blank, allow_destroy: true
  audited
end
