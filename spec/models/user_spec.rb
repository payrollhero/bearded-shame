require 'rails_helper'

describe User do

  let(:alice) { create(:user, :alice) }
  let(:bob)   { create(:user, :bob) }
  let(:query) { "Alice" }

  it "should return query results" do
    expect(User.search(query)).to include alice
    expect(User.search(query)).not_to include bob
  end

end
