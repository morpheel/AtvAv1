class CreateFrequenciaalunos < ActiveRecord::Migration[5.2]
  def change
    create_table :frequenciaalunos do |t|
      t.date :data
      t.references :disciplina, foreign_key: true

      t.timestamps
    end
  end
end
