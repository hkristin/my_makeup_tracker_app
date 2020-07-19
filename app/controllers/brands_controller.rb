class BrandsController < ApplicationController

  get '/brands' do
    @brands = Brand.all
    
    erb :'/brands/index' 
  end

  get '/brands/new' do 
    @brands = Brand.all
    erb :'/brands/new'
  end

  post '/brands' do 
  
  @brand = Brand.create(params[:brand])
  if !params["brand"]["name"].empty?
    @brand.pets << Brand.create(name: params["brand"]["name"])
  end
  
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
    
    if !params["brand"]["name"].empty?
      @brand.pets << Pet.create(name: params["brand"]["name"])
    end
    redirect "brands/#{@brand.id}"
  end
  
end