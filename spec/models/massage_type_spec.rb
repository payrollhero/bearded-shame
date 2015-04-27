require 'rails_helper'

describe MassageType do
  it { should have_many(:orders) }
  it { should have_many(:users) }
end
