class AddPersonagemToFilme < ActiveRecord::Migration[5.1]
  def change
    add_reference :filmes, :personagem, foreign_key: true
  end
end
