require 'rails_helper'

RSpec.describe FilmViewing, type: :model do
  let(:name) { 'name' }
  let(:user) { User.create(name: 'ctaylor') }
  let(:no_name_user) { User.create(name: nil) }
  let(:group) { Group.create(name: 'Drama', user_id: user.id) }
  let(:film_viewing1) { FilmViewing.new(name: 'No Country for Old Men (2007)', running_time: 122, rating: 8.1) }
  let(:film_viewing2) { FilmViewing.new(name: 'A Serious Man (2009)', running_time: 106, rating: 7.1) }
  let(:film_viewing_no_title) { FilmViewing.new(running_time: 140, rating: 7.2) }
  let(:film_viewing_no_rating) { FilmViewing.new(name: 'Dunkirk (2017)', running_time: 106) }
  let(:film_viewing_no_running_time) { FilmViewing.new(name: 'Lincoln (2012)', rating: 7.3) }

  describe 'when it has a title, running time, and rating' do
    it 'is valid' do
      film_viewing1.author_id = user.id
      film_viewing1.save

      expect(film_viewing1).to be_valid
    end
  end

  describe 'when it has no title' do
    it 'is invalid' do
      film_viewing_no_title.author_id = user.id
      film_viewing_no_title.save

      expect(film_viewing_no_title).to_not be_valid
    end
  end

  describe 'when it has no running time' do
    it 'is invalid' do
      film_viewing_no_running_time.author_id = user.id
      film_viewing_no_running_time.save

      expect(film_viewing_no_running_time).to_not be_valid
    end
  end

  describe 'when it has no rating' do
    it 'is invalid' do
      film_viewing_no_rating.author_id = user.id
      film_viewing_no_rating.save

      expect(film_viewing_no_rating).to_not be_valid
    end
  end

  describe 'when it belongs to a group' do
    it 'is valid' do
      film_viewing2.author_id = user.id
      film_viewing2.group_ids = group.id
      film_viewing2.save
      group.save

      expect(group.film_viewing_ids).to include(film_viewing2.id)
    end
  end

  describe 'when it belongs to no group' do
    it 'is valid' do
      film_viewing2.author_id = user.id
      film_viewing2.save

      expect(group.film_viewing_ids.size).to be(0)
    end
  end
end
