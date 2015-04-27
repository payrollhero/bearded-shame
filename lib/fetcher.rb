class Fetcher
  def self.fetch_user_beards
    users  = User.all.sort{|a,b| a.last_name.downcase <=> b.last_name.downcase}
    beards = Beard.where(:user_id => users.map(&:id))
                  .group_by(&:user_id)

    user_beard_list = users.inject({}) do |user_hash, user|
      beard = beards[user.id].try(:first)
      user_hash[user] = beard || Beard.create(:user => user, :status => 'unset')
      user_hash
    end

    user_beard_list
  end
end
