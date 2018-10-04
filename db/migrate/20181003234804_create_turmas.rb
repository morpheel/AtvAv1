class CreateTurmas < ActiveRecord::Migration[5.2]
  def change
    create_table :turmas do |t|
      t.references :sala, foreign_key: true
      t.string :nome

      t.timestamps
    end
  end
end
