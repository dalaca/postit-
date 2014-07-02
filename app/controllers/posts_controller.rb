class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]
  def index
  	@post = Post.all.sort_by{|x| x.total_votes}.reverse
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Your Post was saved"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
    if @post.update(post_params)
      flash[:notice] = "Your Post was updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def vote
    @vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])
  

    if @vote.valid?
     flash[:notice] = "Your vote was counted"
   else 
    flash[:error] = "Your vote was not counted"
   end
  
  redirect_to :back
  end
  
  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
