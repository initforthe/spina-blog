Spina::Engine.routes.draw do
  namespace :blog do
    root to: 'posts#index'

    resources :posts, only: [:show]

    get 'feed.rss', to: 'posts#index', as: :rss_feed, defaults: { format: :rss }
    get 'categories/:id', to: 'categories#show', as: :category
    get 'archive/:year(/:month)', to: 'posts#archive', as: :archive_posts
    get 'tagged/:tag_id(/:tag_name)', to: 'posts#tagged', as: :tagged_posts
  end

  namespace :admin do
    namespace :blog do
      resources :categories
      resources :posts do
        collection do
          get :live
          get :draft
          get :future
        end
      end
    end
  end
end