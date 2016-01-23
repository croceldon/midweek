require 'rails_helper'

RSpec.feature "UserDeletes", type: :feature do
  let(:user) { create(:user) }
  let!(:john) { create(:user, email: 'john@john.com') }

  context 'as a user' do
    before do
      login_as user
    end

    scenario 'I can delete a user', :js do
      visit users_path
      within "tr#user_#{john.id}" do
        click_link 'Delete'
      end

      expect(page).to have_selector '.alert'
      expect(User.count).to eql 1
    end
  end
end
