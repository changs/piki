require 'sinatra/base'

class Piki < Sinatra::Base
  get '/' do
    "Piki welcomes you."
  end
end
