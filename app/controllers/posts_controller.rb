class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to @post.user
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end    
  end

  private 

  def post_params
    params.require(:post).permit( :post, :user_id, :organization_id)
  end

end
