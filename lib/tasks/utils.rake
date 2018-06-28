namespace :utils do
  
  desc "Setup Development"
  task setup_dev: :environment do
    var_save = Rails.root.join('public', 'system')
    p "Executando setups"
      %x(rake db:drop)
      %x(rm -rf var_save)
      %x(rake db:create)
      %x(rake db:migrate)
      %x(rake db:seed)
      %x(rake utils:generate_admins)
      %x(rake utils:generate_members)
      %x(rake utils:generate_ads)
    p "Setups executes with succesful"
  end
  
  
  desc "Cria administradores fakes"
  p "Creating admins..."
  task generate_admins: :environment do
    9.times do
      Admin.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "190195",
                    password_confirmation: "190195",
                    role: [0,0,1,1,1].sample)
    end
  end
  p "Created Admins..."
  
  
  p "Creating members..."
  task generate_members: :environment do
    100.times do
      Member.create!(
                    email: Faker::Internet.email,
                    password: "190195",
                    password_confirmation: "190195")

    end
  end
  p "Created Members..."
  
  
  
  desc "Cria Anúncios Fake"
  p "Creating ads..."
  task generate_ads: :environment do
    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2, 3, 4, 5].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), "r")
      )
    end
  end
  p " >>> Created ads!"
end