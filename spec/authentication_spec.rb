require 'capybara/rspec'

RSpec.describe 'Log in', type: :system do
  before :each do
    User.create(name: 'mclark')
  end

  it 'logs me in' do
    visit '/login'

    within('#new_session') do
      fill_in 'name', with: 'mclark'
    end

    sleep(2)
    click_button 'Log in'

    sleep(2)
    expect(page).to have_content '@mclark'
  end

  describe 'when username is invalid' do
    it 'a notice appears at the top of the page' do
      visit '/login'

      within('#new_session') do
        fill_in 'name', with: 'unknown'
      end

      sleep(2)
      click_button 'Log in'

      sleep(2)
      expect(page).to have_content 'Invalid username.'
    end
  end
end
