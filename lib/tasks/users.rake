namespace 'users' do
  desc 'Create a bunch of random users'
  task :seed => :environment do
    20.times do
      User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email , beard_length: Random.rand(100) ,avatar_url: Faker::Avatar.image)
    end
  end
end
