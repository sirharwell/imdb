class Actor < ApplicationRecord
  has_many :films
  belongs_to :films
end
