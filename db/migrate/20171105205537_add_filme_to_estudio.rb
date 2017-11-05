class AddFilmeToEstudio < ActiveRecord::Migration[5.1]
  def change
    add_reference :estudios, :filme, foreign_key: true
  end
end
