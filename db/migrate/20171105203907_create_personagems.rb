class CreatePersonagems < ActiveRecord::Migration[5.1]
  def change
    create_table :personagems do |t|
      t.string :nome
      t.string :nome_filme
      t.string :nome_ator
      t.float :cache_ator

      t.timestamps
    end
  end
end
