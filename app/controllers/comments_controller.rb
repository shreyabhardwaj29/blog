class CommentsController < ApplicationController
  def index
  end
  def new
    @comments = Comment.new
  end
  
  def show
    @comments = Comment.new
      # @comments.article_id = params[:id]
  end
    
  
  
  def create
    @comments = Comment.new
    @comments.title = params['comment']['title']
    @comments.body = params['comment']['body']
   @comments.article_id = params['comment']['article_id']
    @comments.user_id = current_user.id

    if @comments.save
      #notice = "Your postcomments added successfully"
      flash.notice = "Your Comment has been added"
      redirect_to articles_path(@comments.article_id)
    end
  end
  
  def edit
    @comments = Comment.find(params[:id])
  end
  
  def destroy
    @comments = Comment.find(params[:id])
    @id = @comments.article_id
    if @comments.destroy
      redirect_to article_path(@id)
    end
  end
  
  def update
    @comments = Comment.find(params[:id])
    @comments.title = params['comment']['title']
    @comments.body = params['comment']['body']
    @comments.article_id = params['comment']['article_id']
    @comments.user_id = current_user.id
    if @comments.save
      flash.notice = "Your Comment has been edited"
      redirect_to article_path(@comments.article_id)
    end
  end
  
end