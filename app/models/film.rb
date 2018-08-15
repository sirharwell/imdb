class Film < ApplicationRecord
  has_many :actors, dependent: :destroy
end
