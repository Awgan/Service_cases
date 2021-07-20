# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |k|
	Service.create(data_zgloszenia: "2021-05-#{01+k}", numer: "S#{123+k}/2021", status: "trwa", przydzial: "GM", klient: "NOWIMAX#{k}", miasto: "Łódź", opis: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quam sem, lobortis sed auctor eu, eleifend vel lorem. Etiam et bibendum dui. Donec lectus tellus. ")
end