class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    
  end
  
  def new
    @article = Article.new
    
  end

  def edit
    
  end

  def create
    # binding.pry
    @article = Article.new(set_param)
    @article.user_id = current_user.id
    @article.title = params['article']['title']
    @article.body = params['article']['body']
    @article.category_id = params['article']['category_id']
    @article.publish_date = params['article']['publish_date']
    @article.feature_image_url = params['article']['feature_image_url']
    if @article.publish_date <= Date.today
			@article.is_published = true
		else
			@article.is_published = false
		end
    
      if @article.save
        if not current_user.permissions.exists?(role_id:4) and not current_user.permissions.exists?(role_id:1) and not current_user.permissions.exists?(role_id:3)
            @permission = Permission.new
            @permission.user_id = current_user.id
            @permission.role_id = 2
            if not @permission.save
              redirect_to article_path(@article)
            end
        end
        redirect_to article_path(@article)
      else
        redirect_to new_article_path
      end
  end
  
  def update
    
    @article.user_id = current_user.id
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
   
   @article.destroy
   redirect_to articles_path
 end   
 private

  def set_param
    params.require(:article).permit(:title, :body, :category_id, :publish_date, :feature_image_url, :is_published) 
  end 
  def set_article
    @article = Article.friendly.find(params[:id])
  end
end
