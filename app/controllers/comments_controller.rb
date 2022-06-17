class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET articles/1/comments
  def index
    @comments = @article.comments
  end

  # GET articles/1/comments/1
  def show
  end

  # GET articles/1/comments/new
  def new
    @comment = @article.comments.build
  end

  # GET articles/1/comments/1/edit
  def edit
  end

  # POST articles/1/comments
  def create
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to(@comment.article)
    else
      render action: 'new'
    end
  end

  # PUT articles/1/comments/1
  def update
    if @comment.update(comment_params)
      redirect_to(@comment.article)
    else
      render action: 'edit'
    end
  end

  # DELETE articles/1/comments/1
  def destroy
    @comment.destroy

    redirect_to @article
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:article_id])
    end

    def set_comment
      @comment = @article.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:name, :description, :status, :article_id)
    end
end