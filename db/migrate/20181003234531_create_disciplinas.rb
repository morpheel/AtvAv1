class CreateDisciplinas < ActiveRecord::Migration[5.2]
  def change
    create_table :disciplinas do |t|
      t.string :nome
      t.string :cargaHoraria
      t.references :professor, foreign_key: true

      t.timestamps
    end
  end
end
