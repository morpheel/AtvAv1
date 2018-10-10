json.extract! funcionario, :id, :nome, :telefone, :endereco, :salario, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
