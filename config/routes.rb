EndlessScrollExample::Application.routes.draw do
	resources :posts, :only => [:index, :create]
	root :to => "posts#index"
end
