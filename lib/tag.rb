class Tag < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  validates(:tag_name, {:presence => true, :uniqueness => true})
end
