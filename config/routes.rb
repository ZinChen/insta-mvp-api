Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post '/login', to: 'session#login'
      post '/signup', to: 'session#signup'
      get '/posts', to: 'index#posts'
      get '/comments', to: 'index#comments'
      post '/post_like', to: 'index#post_like'
      post '/create_post', to: 'index#create_post'
      post '/create_comment', to: 'index#create_comment'
    end
  end
end
