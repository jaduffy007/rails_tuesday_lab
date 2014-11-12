Rails.application.routes.draw do

  root 'courses#index'

  ## STUDENTS ROUTES

  # You have to make these :)  See comments on Courses routes !!

  get 'students', to: "students#index", as: 'students'
  
  get 'students/new', to: "students#new", as: 'new_student'

  get 'students/:id', to: "students#show", as: 'student'

  get 'students/:id/edit', to: "students#edit", as: 'edit_student' 

  post 'students', to: "students#create"

  patch 'students/:id', to: "students#update" # course_path(course), method: :update

  delete 'students/:id', to: "students#destroy" # course_path(course), method: :delete

  
  
  ## COURSES ROUTES

  get 'courses', to: "courses#index", as: 'courses' # courses_path  

  get 'courses/new', to: "courses#new", as: 'new_course' # new_course_path
  
  get 'courses/:id', to: "courses#show", as: 'course' # course_path(taco)
  
  get 'courses/:id/edit', to: "courses#edit", as: 'edit_course' # edit_course_path(course)

  post 'courses', to: "courses#create" # course_paths, method: :post

  patch 'courses/:id', to: "courses#update" # course_path(course), method: :update

  delete 'courses/:id', to: "courses#destroy" # course_path(course), method: :delete

end
