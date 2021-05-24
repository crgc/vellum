class GroupsFilmViewing < ApplicationRecord
  belongs_to :group
  belongs_to :film_viewing
end
