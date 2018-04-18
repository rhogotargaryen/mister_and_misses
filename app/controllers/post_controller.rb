
class PostController < ApplicationController
    
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
  
end