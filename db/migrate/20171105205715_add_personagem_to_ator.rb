class AddPersonagemToAtor < ActiveRecord::Migration[5.1]
  def change
    add_reference :ators, :personagem, foreign_key: true
  end
end
