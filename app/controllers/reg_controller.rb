

class RegController < ApplicationController
  
  get '/registry' do
    is_admin?
    @regs = Reg.all
    erb :"#{@@path}/registry"
  end
  
  get '/registry/create_reg' do
    if is_admin?
      erb :"#{@@path}/reg_creator"
    else
      redirect '/registry'
    end
  end
  
  post '/registry' do
    @reg = Reg.new(params)
    if !is_admin?
      redirect '/registry'
    elsif !@reg.errors.full_messages.empty?
      @errors = @reg.errors.full_messages
      erb :"/registry/reg_creator"
    else
      @reg.save
      Couple.first.regs << @reg
      redirect '/registry'
    end
  end
  
end
  