namespace :utils do
  desc "Cria administradores fakes"
  
  task generate_admins: :environment do
    9.times do
      Admin.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "190195",
                    password_confirmation: "190195",
                    role: [0,0,1,1,1].sample)
    end
  end
  
  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2, 3, 4, 5].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample
      )
    end
  end
  
end