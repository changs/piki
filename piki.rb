require 'sinatra/base'

class Piki < Sinatra::Base
  get '/' do
    "Piki welcomes you."
  end

  run! if app_file == $0 # start the server if ruby file executed directly

end
