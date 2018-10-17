class Frequenciaaluno < ApplicationRecord
  belongs_to :disciplina
  has_many :presencas, inverse_of: :frequenciaaluno, dependent: :destroy        
  accepts_nested_attributes_for :presencas, reject_if: :all_blank, allow_destroy: true
  audited
end
