class User < ApplicationRecord
  has_many :film_viewings, dependent: :destroy, foreign_key: :author_id
  has_many :groups, dependent: :destroy

  has_one_attached :avatar, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  after_commit :add_profile_avatar, on: %i[create]

  private

  def add_profile_avatar
    filename = "#{random_director}.jpeg"
    avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'directors', filename)),
                  filename: filename, content_type: 'image/jpg')
  end

  def random_director
    %w[akerman coppola herzog kubrick kurosawa lucas lynch hitchcock scott tarkovsky].sample
  end
end
