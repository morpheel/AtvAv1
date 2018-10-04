class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.date :dt_Nasc
      t.string :endereco

      t.timestamps
    end
  end
end
