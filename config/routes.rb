Rakaba::Application.routes.draw do
  root :to => 'glagne#index'

  match 'login'     => 'auth#login'
  match 'logout'    => 'auth#logout'
  match 'register'  => 'auth#register'

  scope '/about/' do
    match 'anonymity'       => 'about#anonymity'
    match 'closed-boards'   => 'about#closed_boards'
    match 'rakaba'          => 'about#rakaba'
  end

  scope '/admin/' do 
    match 'post/:alias/:id'   => 'posts#update',   constraints: {id: /\d+/, alias: /\w+/}
    match 'thread/:alias/:id' => 'threads#update', constraints: {id: /\d+/, alias: /\w+/}
    match 'boards/:alias'     => 'boards#update',  constraints: {alias: /\w+/}
    match 'boards/create'     => 'boards#create'
    match 'boards'            => 'admin#boards'
    match 'logs'              => 'admin#logs'
    match 'motd'              => 'admin#motd'
  end


  scope "/" do
    match ':alias'                    => "boards#index",    constraints: {alias: /\w+/}
    match ':alias/create'             => "threads#create",  constraints: {alias: /\w+/}
    match ':alias/page/:page'         => 'boards#page',     constraints: {alias: /\w+/, page: /\d+/}
  end
  
  # Threads scope
  scope "/" do
    match ':alias/:id'        => "threads#show", constraints: {alias: /\w+/, id: /\d+/}
    match ':alias/:id/reply'  => "posts#create", constraints: {alias: /\w+/, id: /\d+/}
    match ':alias/delete/:id' => "posts#delete", constraints: {alias: /\w+/, id: /\d+/}
  end

  match '*path' => 'application#not_found_hack'
end
