Rakaba::Application.routes.draw do
  root :to => 'glagne#index'
  
  scope "/" do
    match ':alias' => "boards#index", :constraints => {:alias => /\w+/}
    match ':alias/create' => "threads#create", :constraints => {:alias => /\w+/}
  end
  
  # Threads scope
  scope "/" do
    match ':alias/res/:id.html'       => "threads#show"
    match ':alias/res/:id.html/reply' => "posts#create"
  end

  match '*path' => 'application#not_found_hack'
end
