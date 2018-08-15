class Film < ApplicationRecord
  has_many :actors
  belongs_to :actors
end
