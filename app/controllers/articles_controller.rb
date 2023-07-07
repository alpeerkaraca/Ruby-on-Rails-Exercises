# frozen_string_literal: true

# Inherits from ApplicationController
class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was created successfully.' # alert available too
      redirect_to @article
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def destroy
    @article.delete
    redirect_to articles_path # redirect to the article list
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
      redirect_to @article
    else
      render 'edit'
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
