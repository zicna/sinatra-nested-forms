require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do 
      erb :"pirates/new"
    end

    post '/pirates' do 
      # #binding.pry
      pirate_name = params[:pirate][:name]
      pirate_weight = params[:pirate][:weight]
      pirate_height = params[:pirate][:height]
      @new_pirate = Pirate.new(pirate_name, pirate_weight, pirate_height)

      params[:pirate][:ships].each do |ship|
        #binding.pry
        Ship.new(ship[:name], ship[:type], ship[:booty])
      end
      #binding.pry
      erb :"pirates/show"
    end

  end
end
