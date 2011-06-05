require 'sinatra/base'
#require 'rdiscount'

class Piki < Sinatra::Base

  # Configuration 
  configure do
    set :static, true
    set :public, File.dirname(__FILE__) + '/static' 
  end
  # End of Configuration

  # Helpers

  # Routes
  #
  # Get Routes
  get '/' do
    "Bartosz Pranczke piki, nothing is here for now."
  end

  get '/show/:file' do
    #markdown :esk, :layout_engine => :erb
    halt 404 unless FileTest.exist? ("views/#{params[:file]}" )
    erb :"#{params[:file]}" 
  end

  get '/show/:file/source' do
    halt 404 unless FileTest.exist? ("views/#{params[:file]}" )
    send_file File.dirname(__FILE__) + "/views/#{params[:file]}.mkd", 
        :type => :text
  end
  

  # Post Routes

  # Error Handlers
  error 404 do
    "Sorry, requested page doesn't exist."
  end

  # Start the server if ruby file executed directly
  run! if app_file == $0

end
