class UsersController < ApplicationController

  get '/users/new' do 
    erb :'/users/new'
  end

  post '/users' do 
    @user = User.new(username: params["name"], email: params["email"], password: params["password"])
    
    if @user.save 
      session[:user_id] = @user.id 
      redirect to "users/#{@user.id}"
    else
      redirect to '/signup'
    end
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
    
    @user.save
    redirect to "users/#{@user.id}"
  end
end