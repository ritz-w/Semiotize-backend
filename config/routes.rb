Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/user_images/three', to: 'user_images#three' 
      get '/collections/sfmoma', to: 'collections#sfmoma' 
      get '/collections/kiasma', to: 'collections#kiasma' 
      get '/collections/harvard', to: 'collections#harvard' 
      get '/collections/rmngp', to: 'collections#rmngp' 
      get '/collections/brooklyn', to: 'collections#brooklyn' 


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