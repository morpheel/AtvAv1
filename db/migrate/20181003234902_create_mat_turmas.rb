class CreateMatTurmas < ActiveRecord::Migration[5.2]
  def change
    create_table :mat_turmas do |t|
      t.references :aluno, foreign_key: true
      t.references :turma, foreign_key: true

      t.timestamps
    end
  end
end
