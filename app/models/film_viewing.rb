class FilmViewing < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 10.0 }

  scope :most_recent, -> { order('created_at DESC') }
end
