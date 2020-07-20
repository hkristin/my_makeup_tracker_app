class SessionsController < ApplicationController
  
  get '/sign_up' do
    erb :"users/new"
  end
  
  get '/login' do
    erb :"sessions/login"
  end
  
  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/users'
      
    else 
      redirect to '/login'
    end
  end
  
  get '/logout' do
    session.clear
    redirect to '/'
  end
  
end