require 'spec_helper'

describe Request do
  it { should belong_to(:user) }
  it { should have_valid(:soup).when('Soup') }
  it { should_not have_valid(:soup).when(nil, '') }

  it 'only gives soup requested today and in FIFO' do
    soup_old = FactoryGirl.create(:request, created_at: Date.today - 1)
    soup_new = FactoryGirl.create(:request, created_at: DateTime.now )
    soup_newer = FactoryGirl.create(:request, created_at: DateTime.now )

    expect(Request.results).to eq([soup_new, soup_newer])
  end
end
