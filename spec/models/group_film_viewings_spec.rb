require 'rails_helper'

RSpec.describe GroupsFilmViewing, type: :model do
  let(:name) { 'name' }
  let(:user) { User.create(name: 'mclark') }
  let(:group) { Group.create(name: 'Drama', user_id: user.id) }
  let(:film_viewing_1) { FilmViewing.new(name: 'No Country for Old Men (2007)', running_time: 122, rating: 8.1) }

  describe 'when a film viewing belongs to a group' do
    it 'a GroupsFilmViewing is created' do
      film_viewing_1.group_ids = group.id
      film_viewing_1.save

      group.save

      expect(GroupsFilmViewing.first).not_to be_nil
    end
  end
end
