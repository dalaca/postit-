class PostsController < ApplicationController
  def index
  	@post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
  end

  def edit
  end

  def update
  end
  
end
