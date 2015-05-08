require 'rails_helper'

describe UserFavoriteMassage do
  it { should belong_to(:user) }
  it { should belong_to(:massage_type) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:massage_type_id) }

  it { should_not allow_value('').for(:user_id) }
  it { should_not allow_value('').for(:massage_type_id) }
end
