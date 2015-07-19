require 'pry'
namespace 'users' do
  desc 'Create a bunch of random users'
  task :seed => :environment do
    20.times do
      User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => ["shaved", "trimmed", "massaged_and_trimmed"].sample, :shaved_at => DateTime.now)
    end
  end
end
