require 'sinatra/base'
require 'rdiscount'

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
    "Bartosz Pranczke piki, nothing is here for now."
  end

  get '/esk' do
    markdown :esk, :layout_engine => :erb
  end

  get '/esk/source' do
    send_file File.dirname(__FILE__) + "/views/esk.mkd", :type => :text
  end
  

  # Post Routes

  # Error Handlers
  error 404 do
    "Sorry, requested page doesn't exist."
  end

  # Start the server if ruby file executed directly
  run! if app_file == $0

end
