require 'spec_helper'

describe User do
  it { should have_valid(:fulfilled_by).when(nil, 1) }

  it { should have_valid(:email).when('user@example.com') }
  it { should_not have_valid(:email).when(nil, '', 'user', 'user@', 'user.com', '@.com')}

  it { should have_valid(:first_name).when('Joe') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Smith') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_many(:requests).dependent(:destroy) }

  describe 'uniqueness validations' do
    before(:each) do
      FactoryGirl.create(:user)
    end
      it { should validate_uniqueness_of :email }
  end
end
