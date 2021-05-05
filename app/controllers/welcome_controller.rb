class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome]
    @curso = "rails"
  end
end
