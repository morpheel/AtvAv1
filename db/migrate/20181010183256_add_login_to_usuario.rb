class AddLoginToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :login, :string
    add_index :usuarios, :login, unique: true
  end
end
