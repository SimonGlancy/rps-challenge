require 'sinatra/base'

class RPS < Sinatra::Base
  get '/' do
    erb(:player_form)
  end

  post '/scoreboard' do

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end