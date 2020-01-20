# frozen_string_literal: true

# Posts Controller
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :new_comment, only: %i[show index]

  def show
    @post = Post.with_associations.find(params[:id])
  end

  def index
    @posts = current_user.feed_posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to @post
    else
      flash[:alert] = format_errors(@post.errors)
      redirect_back(fallback_location: new_post_path)
    end
  end

  private

  def posts_params
    params.require(:post).permit(:content, :picture)
  end

  def format_errors(errors)
    alert = "<h2>Could not create post:</h2><ul class='mb-0'>"
    errors.full_messages.each do |m|
      alert += "<li>#{m}</li>"
    end
    alert += "</ul>"
  end
end
