class Api::V1::IndexController < ApplicationController
  def posts
    posts = Post.all
    render json: posts
  end

  def comments
    comments = Comment.all
    render json: comments
  end

  def post_like
    raise StandardError if current_user.nil?

    like = current_user.likes.by_post(params[:post_id]).take
    if like.present?
      like.destroy
    else
      current_user.likes.create(
        post_id: params[:post_id]
      )
    end

    render json: current_user
  rescue AuthorizationError
    render json: {}, status: :unauthorized
  rescue
    render json: { error: 'Bad request' }, status: :bad_request
  end

  def create_post
    raise StandardError if current_user.nil?

    # current_user.posts.create

    render json: current_user
  rescue AuthorizationError
    render json: {}, status: :unauthorized
  rescue
    render json: { error: 'Bad request' }, status: :bad_request
  end

  def create_comment
    raise StandardError if current_user.nil?

    # current_user.posts.create

    render json: current_user
  rescue AuthorizationError
    render json: {}, status: :unauthorized
  rescue
    render json: { error: 'Bad request' }, status: :bad_request
  end

  private

  def safe_params
    params.permit(:post_id)
  end
end
