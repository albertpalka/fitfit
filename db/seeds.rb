# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

STREETS = ['Białobrzeska 53A', 'Skalbmierska 5', 'Postępu 16A', 'Jagiellońska 15', 'Lindleya 14',
           'Borysa Sawinkowa 14', 'Wynalazek 3', 'Ludwika Mycielskiego 21', 'Powstańców Śląskich 2D',
           'Alojzego Felińskiego 2A', 'Stawki 2', 'Jagiellońska 55B'].freeze

((Date.today - 15)..Date.today).each do |a|
  rand(1..3).times do
    orig = "#{STREETS.sample}, Warszawa, Polska"
    dest = "#{STREETS.reject { |e| e == orig }.sample}, Warszawa, Polska"
    dist = Distance.new(orig, dest).call
    Activity.create(created_at: a, original_location: orig, destination_location: dest, distance: dist)
  end
end
