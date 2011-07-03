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
  def link_to(url,text=url,opts={})
    attributes = ""
    opts.each { |key,value| attributes << key.to_s << "=\"" << value << "\" "}
    "<a href=\"#{url}\" #{attributes}>#{text}</a>"
  end

  # Routes
  #
  # Get Routes
  get '/' do
    pages = Dir["views/*.mkd"].to_a
    erb :all, locals: { pages: pages }
  end

  get '/show/:file' do
    #markdown :esk, :layout_engine => :erb
    halt 404 unless FileTest.exist? ((File.dirname(__FILE__) + "/views/#{params[:file]}" + ".mkd") )
    markdown :"#{params[:file]}", :layout_engine => :erb 
  end

  get '/show/:file/source' do
    halt 404 unless FileTest.exist? ("/views/#{params[:file]}" )
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
