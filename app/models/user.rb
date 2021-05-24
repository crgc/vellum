class User < ApplicationRecord
  has_many :film_viewings, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
