class CreatePresencas < ActiveRecord::Migration[5.2]
  def change
    create_table :presencas do |t|
      t.boolean :presenca
      t.references :mat_disc, foreign_key: true
      t.references :frequenciaaluno, foreign_key: true

      t.timestamps
    end
  end
end
