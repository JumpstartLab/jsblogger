class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    audit "Displaying article #{@article.inspect}"
  end

  def index
    @articles, @tag = Article.search(params)
  end

  def new
    audit "Displaying the form"
    @article = Article.new
  end

  def create
    audit "Processing form data"
    @article = Article.new(params[:article])
    audit "Resulting Article: #{@article.inspect}"
    if @article.save
      audit "Save succeeded"
      flash[:notice] = "Article was created."
      redirect_to articles_path
    else
      audit "Save failed"
      render :new
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article was updated."
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    article = Article.find params[:id]
    article.destroy
    flash[:notice] = "#{article} was destroyed."
    redirect_to articles_path
  end
end
