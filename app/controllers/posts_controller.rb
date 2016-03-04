class PostsController < ApplicationController
  # before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = @post.comments.build
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Successfully created a Post! Aha!"
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to posts_path, notice: "Successfully updated a Post! Aha!"
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Successfully deleted a Post! Aha!"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
