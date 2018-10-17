class AddDescricaoToAvaliacao < ActiveRecord::Migration[5.2]
  def change
    add_column :avaliacaos, :descricao, :string
  end
end
