namespace 'users' do
  desc 'Create a bunch of random users'
  task :seed => :environment do
    20.times do
      User.create type: %w(Employer Worker).sample,first_name: Random.firstname, last_name: Random.lastname, email: Random.email, password: 'password', password_confirmation: 'password'
    end
  end
end
