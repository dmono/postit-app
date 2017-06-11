class PostsController < ApplicationController
  # use this to set up instance variables
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:show, :index]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    # Set up an in-memory post object so that model backed form can use it to display form
    @post = Post.new
  end

  def create
    # to check submission
    # add 'binding.pry' here
    # go to server terminal tab in console after submitting form
    # pry should be running already
    # type 'params'

    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = "This post was updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  # Look this up in lecture
  # strong parameters to parse out the attributes we're allowing for mass assignment
  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
    # need a different syntax for array of category ids
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
