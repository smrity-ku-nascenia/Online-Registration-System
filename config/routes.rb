Rails.application.routes.draw do

  get 'create_result/choose_student'

  get 'create_result/assign_grade'
  get 'result_mailer/send_result'

  resources :registration_informations
  resources :global_settings

  post '/global_setting' => 'global_settings#create'

  post "/create_result/assign_grade"

  devise_for :users

  get '/carousel/slider'
  get '/carousel/profile_page'

  resources :assign_course_to_semesters

  resources :semesters
  resources :courses
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'carousel#slider'

  #get '/students/index' =>'students#index'
  get '/students/background' => 'students#background'
  get '/populate_students/' => 'create_result#populate_students'
  get '/populate_results/' => 'create_result#populate_results'
  get '/showcourse' => 'registration_informations#showcourse'
  post '/update_mark' => 'create_result#update_mark'
  get "/registration_informations/new" => "registration_informations#new"
  get "/create_result/show_result" => "create_result#show_result"
  get "/send_email/" => "create_result#send_email"
  get "/see_my_result/" => "registration_informations#see_my_result"
  get '/populate_completed_courses/' =>'registration_informations#populate_completed_courses'
  get '/see_completed_course/' =>'registration_informations#see_completed_course'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
