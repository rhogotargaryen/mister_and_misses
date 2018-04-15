class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fleet"
  end
  
  get '/' do 
      erb :home
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    @error = 
    params.map do |k,v| 
      if v == ""
        k
      end
    end.compact
    if !@error.empty?
      erb :'/error'
    elsif !User.find_by_username(params[:username])
      User.create(params)
    elsif User.find_by_username(params[:username])
      erb :'/signup_login'
    end
  end
  
  get '/login' do
    erb :login
  end
  
  post '/login' do
    "you logged in"
  end
  
  get '/events' do
    @events = Event.all
    erb :events
  end
  
end

