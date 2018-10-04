json.extract! aluno, :id, :nome, :dt_Nasc, :endereco, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
