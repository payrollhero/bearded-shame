require 'rails_helper'

describe Price do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cost) }

  it { should_not allow_value('').for(:name) }
  it { should_not allow_value('').for(:cost) }
end
