class CreateFilmes < ActiveRecord::Migration[5.1]
  def change
    create_table :filmes do |t|
      t.string :nome
      t.integer :meses_producao
      t.string :copyright
      t.string :diretor
      t.float :custo_total
      t.integer :ano_lancamento

      t.timestamps
    end
  end
end
