require 'sinatra/base'

class Piki < Sinatra::Base

  # Configuration 
  configure do
    set :static, true
    set :public, File.dirname(__FILE__) + '/static' 
  end
  # End of Configuration

  # Routes
  #
  # Get Routes
  get '/' do
    "Piki welcomes you."
  end

  # Post Routes

  # Error Handlers
  error 404 do
    "Sorry, requested page doesn't exist"
  end

  run! if app_file == $0 # start the server if ruby file executed directly

end
