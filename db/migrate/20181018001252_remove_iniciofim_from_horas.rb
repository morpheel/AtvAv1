class RemoveIniciofimFromHoras < ActiveRecord::Migration[5.2]
  def change
    remove_column :horas, :inicio, :string
    remove_column :horas, :fim, :string
  end
end
