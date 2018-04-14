require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fleet"
  end
  
  # USER_LIST = User.all.name
  
  get '/' do 
      erb :home
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/signup' do
  #  redirect '/signup' if [params[:name], params[:email], params[:password], params[:username]
  end
  
  get '/login' do
    erb :login
  end
  
  post 'login' do
  end
  
end

