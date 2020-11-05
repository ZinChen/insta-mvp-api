class Api::V1::IndexController < ApplicationController
  def posts
    posts = Post.all
    render json: posts
  end

  def comments
    comments = Comment.all
    render json: comments
  end
end
