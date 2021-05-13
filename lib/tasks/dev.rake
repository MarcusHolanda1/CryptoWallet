namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando banco de dados...') do
        `rails db:drop`
      end
      show_spinner('Criando banco de dados...') { `rails db:create` }
      show_spinner('Migrando banco de dados...') { `rails db:migrate` }
      %x(rails dev:add_mining_types) # Para nao ficar usando o "do" e "end" basta eu usar usar show_spinner('Populando banco de dados...') { %x(rails db:seed)}
      %x(rails dev:add_coins)

    else
      puts 'Você não está em ambiente de desenvolvimento!'
    end
  end

  desc 'Cadastra as moedas'
  task add_coins: :environment do
    show_spinner('Cadastrando moedas...') do
      coins = [{
        description: 'Bitcoin',
        acronym: 'BTC',
        url_image: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gratispng.com%2Fpng-nlpbxi%2F&psig=AOvVaw3kisbmH-sL6_H8_VVeWvW2&ust=1620255445095000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPChhoWQsfACFQAAAAAdAAAAABAD',
        mining_type: MiningType.all.sample
      },

               {
                 description: 'Ethereum',
                 acronym: 'ETH',
                 url_image: 'https://img2.gratispng.com/20180330/wae/kisspng-ethereum-bitcoin-cryptocurrency-logo-tether-bitcoin-5abdfe01b6f4b4.2459439115224007697494.jpg',
                 mining_type: MiningType.find_by(acronym: 'PoW')
               },

               {
                 description: 'Dash',
                 acronym: 'DASH',
                 url_image: 'https://w7.pngwing.com/pngs/37/123/png-transparent-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text.png',
                 mining_type: MiningType.all.sample
               }]

      coins.each do |coin|
        sleep(1)
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc 'Cadastra os tipos de mineração'
  task add_mining_types: :environment do
    show_spinner('Cadastrando tipos de mineração...') do
      mining_types = [
        { description: 'Proof of Work', acronym: 'PoW' },
        { description: 'Proof of Stake', acronym: 'PoS' },
        { description: 'Proof of Capacity', acronym: 'PoC' }
      ]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'Concluído com sucesso!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
