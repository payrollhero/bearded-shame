namespace 'trim_types' do
  desc 'Create Trim Types'
  task :seed => :environment do
    types = [['Clean', 0], ['Goatee',1], ['Chin Strap', 1], ['Hipster', 3], ['Hobo', 4], ['Gandalf', 50]]

    types.each do |type|
      TrimType.find_or_create_by(trim_type: type[0], length: type[1]) do |t|
        t.price = Random.number(100..200)
      end
    end
  end
end
