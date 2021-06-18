require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:name) { 'name' }
  let(:user) { User.create(name: 'mclark') }
  let(:group) { Group.create(name: 'Drama', user_id: user.id) }
  let(:no_name_group) { Group.create(user_id: user.id) }
  let(:film_viewing_1) { FilmViewing.new(name: 'No Country for Old Men (2007)', running_time: 122, rating: 8.1) }
  let(:film_viewing_2) { FilmViewing.new(name: 'A Serious Man (2009)', running_time: 106, rating: 7.1) }

  describe 'when it is created by a user and has a name' do
    it 'is valid' do
      thriller_night = user.groups.new(name: 'Thriller Night')
      thriller_night.save

      expect(thriller_night).to be_valid
    end
  end

  describe 'when it is created by a user but has no name' do
    it 'is invalid' do
      expect(no_name_group).to_not be_valid
    end
  end

  describe 'when it has one or more film viewings' do
    it 'is valid' do
      film_viewing_1.group_ids = group.id
      film_viewing_1.save

      film_viewing_2.group_ids = group.id
      film_viewing_2.save

      group.save

      expect(group.film_viewing_ids).to eq([film_viewing_1.id, film_viewing_2.id])
    end
  end

  describe 'when it has no film viewings' do
    it 'is valid' do
      expect(group.film_viewing_ids.size).to eq(0)
    end
  end
end
