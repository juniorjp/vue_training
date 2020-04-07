Rails.application.routes.draw do
  root 'home#index'
  api_version(module: 'V1', header: { name: 'api_version', value: 'v1' }, default: true) do

    #main resources
    resources :users, defaults: { format: 'json' }
  end
end
