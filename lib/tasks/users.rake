namespace 'users' do
  desc 'Create a bunch of random users'
  task :seed => :environment do
    20.times do
      User.create(first_name: Random.firstname_male,
                  last_name:  Random.lastname)
    end
  end
end
