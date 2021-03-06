Rails.application.routes.draw do

  devise_for :users
  get 'categories/', to: 'categories#index', as: 'categories'
  get 'categories/new', to: 'categories#new', as: 'new_category'
  get 'categories/:id', to: 'categories#show', as: 'category'
  post 'categories', to: 'categories#create'
  get 'categories/:id/edit',to: 'categories#edit', as: 'edit_category'
  patch 'categories/:id' ,to: 'categories#update'
  delete 'categories/:id', to: 'categories#destroy'

  get 'articles/', to: 'articles#index', as: 'articles'
  get 'articles/new', to: 'articles#new', as: 'new_article'
  get 'articles/:id', to: 'articles#show', as: 'article'
  post 'articles', to: 'articles#create'
  get 'articles/:id/edit',to: 'articles#edit', as: 'edit_article'
  patch 'articles/:id' ,to: 'articles#update'
  delete 'articles/:id', to: 'articles#destroy'
  root 'articles#index'

  #routes for comments controller to be written here.
  # get 'comments', to: 'comments#index'
  # get 'comments/new', to: 'comments#new', as: 'new_comment'
  # get 'comments/:id', to: 'comments#show', as: 'comments_show'
  # post 'comments/:id', to: 'comments#create'
  # get 'comments/:id/edit', to: 'comments#edit', as: 'edit_comment'
  # patch 'comments/:id', to: 'comments#update'
  # delete 'comments/:id', to: 'comments#destroy'
  get 'comments', to: 'comments#index'
  get 'comments/new', to: 'comments#new'
  get 'comments/:id', to: 'comments#show', as: 'comment'
  post 'comments/', to: 'comments#create'
  get 'comments/:id/edit', to: 'comments#edit', as: 'comment_edit'
  patch 'comments/:id', to: 'comments#update'
  delete 'comments/:id', to: 'comments#destroy'

end

