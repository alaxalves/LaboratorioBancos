class Filme < ApplicationRecord
  belongs_to :Estudio
  has_many :Personagems
end
