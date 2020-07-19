class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index' 
  end

  get '/users/new' do 
    erb :'/users/new'
  end

  post '/users' do 
    @user = Brand.create(params[:user])
    
    if !params["brand"]["name"].empty?
      @brand.user = User.create(name: params["user"]["name"])
    end
    
    @user.save
    
    redirect to "users/#{@user.id}"
  end

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'/users/edit'
  end
  
  patch '/users/:id' do 
    @user = User.find(params[:id])
    @user.update(params[:user])
    if !params["owner"]["name"].empty?
      @user.brand = Brand.create(name: params["brand"]["name"])
    end
    
    @user.save
    redirect to "users/#{@user.id}"
  end
end