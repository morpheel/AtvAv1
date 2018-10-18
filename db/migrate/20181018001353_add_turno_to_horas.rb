class AddTurnoToHoras < ActiveRecord::Migration[5.2]
  def change
    add_column :horas, :turno, :string
  end
end
