
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  #Base
  get '/' do
  end
  
  #New
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    @article = Article.create(params)
    
    redirect to "/articles/#{@article.id}"
  end
  
  #Show
  get "/articles/:id" do

    erb :show
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
end
