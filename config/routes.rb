Rails.application.routes.draw do

  resources :course_semesters
  resources :enrollments
  resources :registration_informations
  resources :semesters
  resources :courses
  devise_for :users

  get 'create_result/choose_student'
  get 'create_result/assign_grade'
  get 'result_mailer/send_result'


  get '/current_semester/' => 'semesters#current_semester'
  get '/change_current_semester/' => 'semesters#change_current_semester'

  post 'change_semester' => 'semesters#change_semester'

  post "/create_result/assign_grade"

  get '/carousel/slider'
  get '/carousel/profile_page'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'carousel#slider'

  #get '/students/index' =>'students#index'
  get '/students/background' => 'students#background'
  get '/populate_students/' => 'create_result#populate_students'
  get '/populate_results/' => 'create_result#populate_results'
  post '/showcourse' => 'registration_informations#showcourse'
  get '/show_semester_course' => 'create_result#show_semester_course'
  get '/show_course' => 'course_semesters#show_course'
  get '/semester_course' => 'registration_informations#semester_course'
  post '/update_mark' => 'create_result#update_mark'
  get "/create_result/show_result" => "create_result#show_result"
  get '/populate_courses/'=> "course_semesters#populate_courses"
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
