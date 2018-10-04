class CreateHoras < ActiveRecord::Migration[5.2]
  def change
    create_table :horas do |t|
      t.time :inicio
      t.time :fim

      t.timestamps
    end
  end
end
