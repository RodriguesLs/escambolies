# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cadastring categories..."
categories = ["Animais e acessórios",
              "Esportes",
              "Para a sua casa",
              "Eletrônicos e celulares",
              "Músicas e hobbies",
              "Bebês e crianças",
              "Moda e beleza",
              "Veículos e barcos",
              "Imóveis",
              "Empregos e negócios"]
              
categories.each do |category|
  Category.find_or_create_by(description: category)
end
puts "Categories saved!"

Admin.create!(email: "admin@admin", 
            password: "190195", 
            password_confirmation: "190195", 
            role: 0)
            
Admin.create!(email: "test@test",
              password: "testers",
              password_confirmation: "testers",
              role: 1)
              
Member.create!(
              email: "member@member",
              password: "190195",
              password_confirmation: "190195"
              )