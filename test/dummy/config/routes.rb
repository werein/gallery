Rails.application.routes.draw do

  mount Gallery::Engine => "/gallery"
  mount Foundationstone::Engine => "/"
end