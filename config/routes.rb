Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :users, only:[:show,:index,:edit,:update,:destroy] do
    resource :relationships, only:[:create,:destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end  
  resources :books, except:[:new]
  
end
