require 'spec_helper'

feature 'user fulfills a soup request' do
# ACCEPTANCE CRITERIA
# * User clicks on fulfill a request link
# * I only see soup requests created on the current day
# * I click on button fulfill to make the fulfillment
# * When I click on the button fulfill, the match is made and the soup request is no longer displayed on the list
# * Clicking fulfill edits the request by giving the request a user_id
# * I am redirected back to the index of requests
  let(:soup_fulfiller) { FactoryGirl.create(:user) }

  scenario 'user fulfills a request' do
    soup_wanter = FactoryGirl.create(:user)
    soup_request = FactoryGirl.create(:request, user: soup_wanter)
    sign_in_as(soup_fulfiller)

    click_link 'Fulfill a Soup Request'
    expect(page).to have_content(soup_wanter.name)
    expect(page).to have_content(soup_request.soup)

    click_link 'Fulfill Request'
    expect(page).to have_content('Request Fulfilled!')
    expect(page).to_not have_content(soup_wanter.name)
    expect(page).to_not have_content(soup_request.soup)
  end
end
