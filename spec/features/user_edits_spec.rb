require 'rails_helper'

RSpec.feature "UserEdits", type: :feature do
  let(:user) { create(:user) }
  let!(:john) { create(:user, email: 'john@john.com') }

  context 'as a user' do
    before do
      login_as user
    end

    scenario 'I can edit a user', :js do
      visit users_path
      within "tr#user_#{john.id}" do
        click_link john.email
      end
      fill_in 'Email', with: 'something@new.com'
      click_button 'Save'

      expect(page).to have_no_selector 'form'
      expect(page).to have_content 'something@new.com'
      john.reload
      expect(john.email).to eql 'something@new.com'
    end
  end
end
