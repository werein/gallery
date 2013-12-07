Rails.application.routes.draw do

  mount Gallery::Engine => "/gallery"
  mount Auth::Engine => "/auth"
  mount Core::Engine => "/"
end