class BrandsController < ApplicationController

  get '/brands' do
    if is_logged_in?
      @brands = current_user.brands
      erb :'/brands/index' 
    else 
      redirect to '/login'
    end
  end

  get '/brands/new' do 
    @brands = Brand.all
    erb :'/brands/new'
  end

  post '/brands' do 
     @brand = Brand.create(params[:brand])
     
     redirect "brands/#{@brand.id}"
  end

  get '/brands/:id/edit' do 
    @brand = Brand.find(params[:id])
    @users = User.all
    erb :'/brands/edit'
  end

  get '/brands/:id' do 
    @brand = Brand.find(params[:id])
    erb :'/brands/show'
  end

  patch '/brands/:id' do 
    @brand = Brand.find(params[:id])
    @brand.update(params[:brand])
  
    redirect "brands/#{@brand.id}"
  end
  
end