class User < ApplicationRecord
  has_many :film_viewings, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
