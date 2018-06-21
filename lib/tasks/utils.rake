namespace :utils do
  desc "Cria administradores fakes"
  
  task generate_admins: :environment do
    10.times do
      Admin.create!(email: Faker::Internet.email,
                    password: "190195",
                    password_confirmation: "190195")
    end
  end

end
