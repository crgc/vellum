class Group < ApplicationRecord
  belongs_to :user

  has_many :groups_film_viewings, dependent: :destroy
  has_many :film_viewings, through: :groups_film_viewings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
end
