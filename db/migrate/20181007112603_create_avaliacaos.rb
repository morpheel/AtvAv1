class CreateAvaliacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :avaliacaos do |t|
      t.string :nome
      t.string :data
      t.references :disciplina, foreign_key: true

      t.timestamps
    end
  end
end
