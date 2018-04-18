 
class EventController < ApplicationController 
 
 get '/events' do
    @events = Event.all
    is_admin?
    erb :"#{@@path}/events"
  end
  
  get '/events/event_edit/:event_id' do
    if is_admin?
      @event = Event.find_by_id(params[:event_id])
      erb :"#{@@path}/eventeditor"
    elsif @@path == "/users"
      redirect '/events'      
    else
      redirect :'/'
    end
  end
  
  post '/events/event_edit/:event_id' do
    @event = Event.find_by_id(params[:event_id])
    @event.update(params.except(:event_id))
    if is_admin? && @event.errors.full_messages.empty?
      @events = Event.all
      erb :"#{@@path}/events"
    elsif is_admin?
      erb :"#{@@path}/eventeditor"
    end
  end
  
  get '/events/event_create' do
    if is_admin?
      erb :"#{@@path}/eventcreator"
    else
      erb :"#{@@path}/events"
    end
  end
  
  post '/events/event_create' do
    @event = Event.create(params)
    if is_admin? && @event.errors.full_messages.empty?
      redirect "/events"
    elsif is_admin?
      erb :"#{@@path}/eventcreator"
    end
  end
  
  get '/events/event_delete/:event_id' do
    if is_admin? && Event.find_by_id(params[:event_id])
      @del = Event.find_by_id(params[:event_id])
      Event.delete(params[:event_id])
      erb :"#{@@path}/confirmed_delete"
    else
      redirect "/events"
    end
  end
  
end