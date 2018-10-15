class AddTurmaToDisciplinas < ActiveRecord::Migration[5.2]
  def change
    add_reference :disciplinas, :turma, foreign_key: true
  end
end
