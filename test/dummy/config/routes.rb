Rails.application.routes.draw do

  mount Gallery::Engine => "/gallery"
  mount Auth::Engine => "/auth"
  mount Foundationstone::Engine => "/"
end