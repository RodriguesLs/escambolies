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

end
