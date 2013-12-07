Gallery::Engine.routes.draw do
  scope '(:locale)', locale: Regexp.new(I18n.available_locales.join('|')) do
    root 'expositions#index'
  end
  
  localized do 
    resources :expositions, path: '/' do
      resources :images, except: [:index, :new]
      resources :videos, except: [:index, :new]
    end
  end
end