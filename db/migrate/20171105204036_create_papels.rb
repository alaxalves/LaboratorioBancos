class CreatePapels < ActiveRecord::Migration[5.1]
  def change
    create_table :papels do |t|
      t.text :descricao

      t.timestamps
    end
  end
end
