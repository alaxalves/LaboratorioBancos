json.extract! filme, :id, :nome, :meses_producao, :copyright, :diretor, :custo_total, :ano_lancamento, :created_at, :updated_at
json.url filme_url(filme, format: :json)
