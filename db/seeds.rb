# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Criando as moedas..."

Coin.create!(
    description: "Bitcoin", 
    acronym: 'BTC', 
    url_image: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gratispng.com%2Fpng-nlpbxi%2F&psig=AOvVaw3kisbmH-sL6_H8_VVeWvW2&ust=1620255445095000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPChhoWQsfACFQAAAAAdAAAAABAD'
)

Coin.create!(
    description: "Ethereum", 
    acronym: 'ETH', 
    url_image: 'https://img2.gratispng.com/20180330/wae/kisspng-ethereum-bitcoin-cryptocurrency-logo-tether-bitcoin-5abdfe01b6f4b4.2459439115224007697494.jpg'
)

Coin.create!(
    description: "Dash", 
    acronym: 'DASH', 
    url_image: 'https://w7.pngwing.com/pngs/37/123/png-transparent-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text.png'
)

puts "Moedas cadastradas com sucesso"