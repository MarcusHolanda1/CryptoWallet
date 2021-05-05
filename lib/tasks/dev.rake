namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando banco de dados...') { %x(rails db:seed)} #Essa é uma outra forma de chamar o yield sem o do e end
      %x(rails db:drop)

      show_spinner('Criando banco de dados...') do
      %x(rails db:create)
      end

      show_spinner('Migrando banco de dados...') do
      %x(rails db:migrate)
      end

      show_spinner('Populando banco de dados...') do
      %x(rails db:seed)
      end
      
      #Para nao ficar usando o "do" e "end" basta eu usar usar show_spinner('Populando banco de dados...') { %x(rails db:seed)}
    else
      puts 'Você não está em ambiente de desenvolvimento!'
    end
  end

  def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
  end
end
