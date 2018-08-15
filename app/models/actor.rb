class Actor < ApplicationRecord
  belongs_to :film
  has_many :comments, dependent: :destroy
end
