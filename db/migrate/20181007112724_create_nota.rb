class CreateNota < ActiveRecord::Migration[5.2]
  def change
    create_table :nota do |t|
      t.string :nota
      t.references :mat_disc, foreign_key: true
      t.references :avaliacao, foreign_key: true

      t.timestamps
    end
  end
end
