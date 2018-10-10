class CreateFuncionarios < ActiveRecord::Migration[5.2]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :telefone
      t.string :endereco
      t.float :salario

      t.timestamps
    end
  end
end
