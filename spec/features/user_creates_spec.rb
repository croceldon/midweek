require 'rails_helper'

RSpec.feature "UserCreates", type: :feature do
  let(:user) { create(:user) }

  context 'as a user' do
    before do
      login_as user
    end

    scenario 'I can create a user', :js do
      visit users_path
      click_link 'New User'
      fill_in 'Email', with: 'someone@something.com'
      click_button 'Save'

      expect(page).to have_no_selector '.alert'
      expect(page).to have_selector '.alert'
      expect(User.count).to eql 2
      expect(page).to have_content 'someone@something.com'
    end
  end


end
