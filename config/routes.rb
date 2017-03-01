Rails.application.routes.draw do
  get 'differentiate/*equation', to: 'differentiations#differentiate'
end
