class Cocktail < ApplicationRecord
  has_attachment :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
end
