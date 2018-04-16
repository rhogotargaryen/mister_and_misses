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
    validate
    if !User.find_by_username(params[:username])
      User.create(params)
    elsif User.find_by_username(params[:username])
      erb :signup_login
    end
    erb :home
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
  
  get '/story' do
    @couple_story = Couple.first.story
    erb :story
  end
  
  helpers do
    
    def validate
      params[:username].downcase!
      @errors = params.map do |k,v| 
        k if v == ""  #refractor .blank?
      end.compact
      if !@errors.empty?
        erb :errors
      end
    end
    
    def logged_in?
        !!current_user
    end
    
    def log_out
        session.destroy
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def is_admin
      logged_in?
      if !!@current_user.couple
        @@path = "/couple"
      elsif logged_in?
        @@path = "/users"
      else
        @@path = ""
      end
    end
  end
end
