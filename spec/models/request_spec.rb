require 'spec_helper'

describe Request do
  it { should belong_to(:user) }
  it { should have_valid(:soup).when('Soup') }
  it { should_not have_valid(:soup).when(nil, '') }
end
