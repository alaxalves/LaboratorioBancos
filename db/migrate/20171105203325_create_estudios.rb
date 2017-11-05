class CreateEstudios < ActiveRecord::Migration[5.1]
  def change
    create_table :estudios do |t|
      t.string :nome
      t.string :nome_dono
      t.date :data_fundacao
      t.float :faturamento

      t.timestamps
    end
  end
end
