Openexam2::Application.routes.draw do

  resources :groups do
    get 'grade', on: :member
    get 'chart', on: :member
    get 'leave', on: :member, :as => :leave
  end

  get '/groups/:id/remove_student/:student_id' => 'groups#remove_student', :as => :remove_student
  post '/groups/join' => 'groups#join', :as => :group_join
  get '/groups/:id/list_members' => 'groups#list_members', :as => :list_members

  resources :users, :except => [:index] do
    get 'dashboard', on: :member
    get 'myprofile', on: :member
    get 'info', on: :member
        get 'chart', on: :member
  end

  put 'questions/approve', :to => 'questions#approve'

  resources :questions, :except => [:index] do
    get 'chart', on: :member
  end




  resources :quizzes do
      get 'take', on: :member
      post 'answers', on: :member
      get 'answers', on: :member
      get 'score', on: :member
      get 'set_status', on: :member
      get 'results', on: :member
      get 'chart', on: :member
      get 'overview', on: :member
      get 'submitted_questions', on: :member
      get 'notify_students', on: :member
      resources :questions do
        collection do
          get 'review'
        end
      end
  end

  resources :sessions, :path_names => {:new => 'login'}



  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/dashboard' => 'users#dashboard'

  get '/dashboard/:status' => 'users#dashboard_status'







  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'site#landing'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
