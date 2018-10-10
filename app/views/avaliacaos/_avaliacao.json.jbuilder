json.extract! avaliacao, :id, :nome, :data, :disciplina_id, :created_at, :updated_at
json.url avaliacao_url(avaliacao, format: :json)
