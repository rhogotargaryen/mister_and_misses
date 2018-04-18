 
class StoryController < ApplicationController 
  
  get '/story' do
    is_admin?
    @couple_story = Couple.first.story
    erb :"#{@@path}/story"
  end
  
  post '/story' do
    if is_admin?
      cup = Couple.first
      cup.story = params[:new_story]
      cup.save
      @couple_story = Couple.first.story
      erb :"#{@@path}/story"
    else
      redirect "/story"
    end
  end

  get '/story/edit' do
    if is_admin?
      @couple_story = Couple.first.story
      erb :"#{@@path}/story_editor"
    else
      redirect '/story'
    end
  end
  
end