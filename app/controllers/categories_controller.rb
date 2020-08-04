class CategoriesController < ApplicationController

  get '/categories' do
    if is_logged_in?
      @categories = Category.all
      erb :'/categories/index'
    else
      redirect to '/login'
    end
  end

  get '/categories/new' do
    erb :'/categories/new'
  end

  post '/categories' do
    @category = Category.new
    @category.name = params[:name]
    if !params["brand_ids"].empty?
      params["brand_ids"].each do |brand_id|
        @category.brands << Brand.find_by(brand_id.to_i)
      end
    end

    if @category.save
      erb :"categories/index"
    else
      redirect to "/categories/new"
    end
  end

  get '/categories/:id' do
    if is_logged_in?
      @category = Category.find_by(params[:id])
      erb :'categories/show'
    else
      redirect to '/login'
    end
  end


  delete '/categories/:id' do
    if is_logged_in?
      @category = Category.find_by(params[:id])
      @category.destroy
      redirect to '/categories'
    else
      redirect to '/login'
    end
  end

end
