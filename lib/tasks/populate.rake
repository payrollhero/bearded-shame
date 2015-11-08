Rake::TaskManager.record_task_metadata = true

namespace 'populate' do
  desc 'run all the seed tasks'
  task :seeds => :environment do |task|
    seed_tasks.each do |task|
      puts "#{task.comment} - #{task.name}"
      Rake::Task["#{task}"].invoke
    end
  end

  def seed_tasks
    Rake::Task.tasks.select do |t|
      t.to_s.end_with? "seed"
    end
  end
end
