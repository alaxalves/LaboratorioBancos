class AddPapelToAtor < ActiveRecord::Migration[5.1]
  def change
    add_reference :ators, :papel, foreign_key: true
  end
end
