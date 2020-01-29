class Pet < ApplicationRecord
  validates_presence_of :name, :image, :age, :sex

  belongs_to :shelter
end
