class CreateSalas < ActiveRecord::Migration[5.2]
  def change
    create_table :salas do |t|
      t.string :numSala
      t.string :bloco
      t.string :capacidade

      t.timestamps
    end
  end
end
