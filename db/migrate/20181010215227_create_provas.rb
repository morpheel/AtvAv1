class CreateProvas < ActiveRecord::Migration[5.2]
  def change
    create_table :provas do |t|
      t.float :nota
      t.references :avaliacao, foreign_key: true
      t.references :mat_disc, foreign_key: true

      t.timestamps
    end
  end
end
