class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :destroy, :edit]
  
  
  http_basic_authenticate_with name: "Omer", password: "secret", except: [:index, :show]
  
  
  def index
    @article = Article.all
  end
  
  def new
    @article = Article.new()
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    end
  end
  
  
  def destroy
    if @article.destroy
      redirect_to articles_path
    else
      render 'index'
    end
  end
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
