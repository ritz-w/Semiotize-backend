Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artists
      resources :artworks
      resources :artwork_motifs
      resources :motifs
      resources :user_image_motifs
      resources :user_images
      post '/user_images/upload', to: 'user_images#upload' 
    end
  end
end