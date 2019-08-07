require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  #index
  get '/recipes' do
    @recipes = Recipe.all
    erb:index
  end

  #new
  get '/recipes/new' do
    erb :new
  end
  
  #create
  post '/recipes' do
    @recipe = Recipe.create(params)

    redirect "/recipes/#{@recipe.id}"
  end

  #show
  get '/recipes/:id' do
    # binding.pry
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])

  erb :edit
  end

  #update
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  #destroy
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect '/recipes'
  end
end
