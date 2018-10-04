class CreateMatDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :mat_discs do |t|
      t.references :mat_turma, foreign_key: true
      t.references :disciplina, foreign_key: true

      t.timestamps
    end
  end
end
