
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  post '/articles' do
    article = Article.create(title: params['title'], content: params['content'])
    
    redirect 'articles/' + article.id.to_s
  end
  
  get '/articles' do
    @articles = Article.all
    
    erb :index
  end
  
  get '/articles/new' do
    erb :new
  end
  
  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    
    erb :article
  end
  
  get '/articles/:id/edit' do
    article = Article.find_by_id(params[:id])
    
    article.title = params['title']
    article.content = params['content']
    
    article.save
    
    erb :edit
  end
  
  
end
