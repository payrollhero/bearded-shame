namespace 'massage_types' do
  desc 'Create Massage Types'
  task :seed => :environment do
    types = [['Deep Tissue', 60], ['Swedish', 90], ['Hot Stone', 120], ['Shiatsu', 120]]

    types.each do |type|
      MassageType.find_or_create_by!(massage_type: "#{type[0]}", length: "#{type[1]}") do |m|
        m.price = Random.number(100..200)
      end
    end
  end
end
