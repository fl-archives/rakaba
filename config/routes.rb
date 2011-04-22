Rakaba::Application.routes.draw do
  root :to => 'glagne#index'
  
  scope "/" do
    match ':alias'                    => "boards#index",    constraints: {alias: /\w+/}
    match ':alias/create'             => "threads#create",  constraints: {alias: /\w+/}
    match ':alias/page/:page_number'  => 'boards#index',    constraints: {alias: /\w+/, page_number: /\d+/}
  end
  
  # Threads scope
  scope "/" do
    match ':alias/:id.html'       => "threads#show", constraints: {alias: /\w+/, id: /\d+/}
    match ':alias/:id.html/reply' => "posts#create", constraints: {alias: /\w+/, id: /\d+/}
  end

  match '*path' => 'application#not_found_hack'
end
