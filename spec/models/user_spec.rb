require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) { 'name' }
  let(:user) { User.create(name: 'ctaylor') }
  let(:no_name_user) { User.create(name: nil) }
  let(:fv_1) { FilmViewing.new(name: 'No Country for Old Men (2007)', running_time: 122, rating: 8.1) }
  let(:fv_2) { FilmViewing.new(name: 'A Serious Man (2009)', running_time: 106, rating: 7.1) }

  describe 'can be created' do
    it 'and is valid if it has a name' do
      expect(user).to be_valid
    end

    it 'but is invalid if a name is not present' do
      expect(no_name_user).to_not be_valid
    end

    it 'and be the author of a film viewing' do
      film_viewing = FilmViewing.new(name: 'Fury (2014)', running_time: 134, rating: 7.4)
      film_viewing.author_id = user.id
      film_viewing.save

      expect(film_viewing).to be_valid
    end

    it 'and be the author of many film viewings' do
      fv_1.author_id = user.id
      fv_1.save

      fv_2.author_id = user.id
      fv_2.save

      expect(FilmViewing.first.author_id).to eq(user.id)
      expect(FilmViewing.last.author_id).to eq(user.id)
    end

    it 'and also can create a group' do
      group = user.groups.new(name: 'Drama')
      group.save

      expect(group).to be_valid
    end
  end
end
