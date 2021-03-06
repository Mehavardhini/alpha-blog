class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 4)
  end

  def create

    @article = Article.new(article_params)
    # @article.user = User.first  this is suppsoed teh
    @article.user_id = 1
    # debugger
    if @article.save
      flash[:success] = "Article was successfully saved"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.user = User.first
    if @article.update(article_params)
      flash[:success] = "Article was updated successfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was deleted successfully"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title,:description)
  end
end
