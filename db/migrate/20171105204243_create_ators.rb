class CreateAtors < ActiveRecord::Migration[5.1]
  def change
    create_table :ators do |t|
      t.string :nome
      t.string :nome_artistico
      t.integer :seguro_social
      t.string :nacionalidade
      t.string :idade

      t.timestamps
    end
  end
end
