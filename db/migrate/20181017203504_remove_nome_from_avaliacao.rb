class RemoveNomeFromAvaliacao < ActiveRecord::Migration[5.2]
  def change
    remove_column :avaliacaos, :nome, :string
  end
end
