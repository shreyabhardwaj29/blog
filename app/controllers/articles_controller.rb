class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

  end
  
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(set_param)
    @article.title = params['article']['title']
    @article.body = params['a<p id="notice"><%= notice %></p>rticle']['body']
    @article.category_id = params['article']['category_id']
    @article.publish_date = params['article']['publish_date']
    @article.feature_image_url = params['article']['feature_image_url']
    if params['article']['is_published'] == "1"
      @article.is_published = true
    else
      @article.is_published = false
    end
    
      if @article.save
        redirect_to article_path(@article)
      else
        redirect_to new_article_path
      end
  end
  
  def update
    @article = Article.find(params[:id])
    @article.title = params["article"]["title"]
    @article.body = params["article"]["body"]
    @article.category_id = params["article"]["category_id"]
    @article.publish_date = params["article"]["publish_date"]
    @article.feature_image_url = params["article"]["feature_image_url"]
    @article.is_published = params["article"]["is_published"]

    if @article.save
      redirect_to article_path(@article.id)
    else
      render action: 'edit'
    end
  end
  
  def destroy
   @article = Article.find(params[:id])
   @article.destroy
   redirect_to articles_path
 end   
 private

   def set_param
    params.require(:article).permit(:title, :body, :category_id, :publish_date, :feature_image_url, :is_published) 
  end 
end
