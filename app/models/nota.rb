class Nota < ApplicationRecord
  belongs_to :mat_disc
  belongs_to :avaliacao
  audited
end
