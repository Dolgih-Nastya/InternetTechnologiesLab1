class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = article_params[:title]
    @article.text  = article_params[:text]
    if @article.save
      redirect_to @article
    else
      render 'new'
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = article_params[:title]
    @article.text  = article_params[:text]
    if @article.save
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end



end
