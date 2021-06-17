class FilmViewing < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :groups_film_viewings, dependent: :destroy
  has_many :groups, through: :groups_film_viewings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 10.0 }
  validates :running_time, presence: true, numericality: { greater_than_or_equal_to: 15, less_than_or_equal_to: 540 }

  scope :most_recent, -> { order('created_at DESC') }
  scope :created_by, ->(author) { includes(:author).where('author_id = ?', author.id).joins(:groups_film_viewings) }
  scope :created_by_unassigned, ->(author) { includes(:author).where('author_id = ?', author.id).left_outer_joins(:groups_film_viewings).where('group_id IS NULL') }
end
