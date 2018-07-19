class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :amounts
  has_many :ingredients, through: :amounts
  validates(:title, {:presence => true, :uniqueness => true})
end
