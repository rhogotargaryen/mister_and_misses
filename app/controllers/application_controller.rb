class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fleet"
  end
  
  get '/' do
    if is_admin? || logged_in?
      erb :"#{@@path}/dashboard"
    else
      erb :home
    end
  end
  
  get '/signup' do
    if logged_in?
      is_admin?
      erb :"#{@@path}/dashboard"
    else
      erb :signup
    end
  end
  
  post '/signup' do
    params[:username].downcase!
    @current_user = User.new(params)
    if User.find_by_username(@current_user.username)
      erb :signup_login
    elsif !@current_user.save
      erb :signup
    else
      session[:user_id] = @current_user.id
      is_admin?
      erb :"#{@@path}/dashboard"
    end
  end
  
  get '/login' do
    is_admin?
    if @current_user
      erb :"#{@@path}/dashboard"
    else
      erb :login
    end
  end
  
  post '/login' do
    params[:username].downcase!
    a = User.find_by_username(params[:username])
    if a.nil?
      @error = "please fill in the forms for username and password"
      erb :login
    elsif a.authenticate(params[:password])
      session[:user_id] = a.id
      is_admin?
      erb :"#{@@path}/dashboard"
    else
      @error = "username or password invalid please try again or signup!"
      erb :login
    end
  end
  
  get '/logout' do
    session.destroy
    erb :home
  end

  get '/guestbook' do
    @guest_sigs = Post.all
    is_admin?
    erb :"#{@@path}/guestbook"
  end
  
  get '/guestbook/delete_sig/:post_id' do
    if is_admin?
      @post = Post.find(params[:post_id])
      Post.delete(params[:post_id])
    end
    redirect "/guestbook"
  end
  
  get '/guestbook/create_sig' do
    is_admin?
    if logged_in?
      erb :"#{@@path}/sig_creator"
    else
      redirect '/login'
    end
  end
  
  post '/guestbook' do
    if is_admin? || logged_in?
      Couple.first.user.posts << Post.create(content: params[:content])
      redirect '/guestbook'
    end
  end
    
  helpers do
      
    def logged_in?
        !!current_user
    end
      
    def log_out
        session.clear
        @@path = ""
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def is_couple?
      !!current_user.couple
    end
    
    def is_admin?
      @@path = "/viewonly"
      return false if !logged_in?
      if Couple.first.user_id == session[:user_id].to_s
        @@path = '/couple'
        true
      elsif logged_in?
        @@path = "/users"
        false
      end
    end
    
  end
  
end

