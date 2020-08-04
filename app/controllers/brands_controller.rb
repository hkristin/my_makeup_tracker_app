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

     @brand = Brand.new

     @brand.name = params[:name]
     @brand.palettes = params[:palettes]
     @brand.age = params[:age]

     if(params[:clean] == "true")
       @brand.clean = true
     else
       @brand.clean = false
     end

     current_user.brands << @brand

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
    params.delete("_method") # deletes the _method property from the params hash (via form data)
    if current_user.id == @brand.user_id && @brand.update(params)
      redirect "brands/#{@brand.id}"
    else
      redirect "brands/#{@brand.id}/edit"
    end
  end

  delete '/brands/:id' do
    if is_logged_in? && current_user.id == Brand.find(params[:id]).user_id
      @brand = Brand.find(params[:id])
      @brand.destroy
      redirect to '/brands'
    else
      redirect to '/login'
    end
  end

end
