namespace 'users' do
  desc 'Create random users'
  task :seed => :environment do
    20.times do
      User.create(first_name: Random.firstname_male, last_name: Random.lastname, email: Random.email)
    end
  end
end
