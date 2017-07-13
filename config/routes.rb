# == Route Map
#
#                  Prefix Verb   URI Pattern                        Controller#Action
#           contact_index GET    /contact/index(.:format)           contact#index
#                    root GET    /                                  words#index
#               words_new POST   /words/new(.:format)               words#new
#   words_show_fonts_list GET    /words/show_fonts_list(.:format)   words#show_fonts_list
# words_show_example_list GET    /words/show_example_list(.:format) words#show_example_list
#               words_add GET    /words/add(.:format)               words#add
#               tag_words GET    /words/tag(.:format)               words#tag
#                   words GET    /words(.:format)                   words#index
#                         POST   /words(.:format)                   words#create
#                new_word GET    /words/new(.:format)               words#new
#               edit_word GET    /words/:id/edit(.:format)          words#edit
#                    word GET    /words/:id(.:format)               words#show
#                         PATCH  /words/:id(.:format)               words#update
#                         PUT    /words/:id(.:format)               words#update
#                         DELETE /words/:id(.:format)               words#destroy
#            import_words POST   /words/import(.:format)            words#import
#                         GET    /words(.:format)                   words#index
#                 contact GET    /contact(.:format)                 contact#index
#         contact_confirm POST   /contact/confirm(.:format)         contact#confirm
#          contact_thanks POST   /contact/thanks(.:format)          contact#thanks
#       letter_opener_web        /letter_opener                     LetterOpenerWeb::Engine
#
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment
#

Rails.application.routes.draw do
  get 'contact/index'

  root "words#index"
  
  post "words/new"
  
  get "words/show_fonts_list"
  get "words/show_example_list"
  get "words/add"
  
  resources :words do # => tagアクションを追加しました。
    collection do
      get 'tag'
    end
  end
  
  resources 'words', only: :index do
    collection { post :import }
  end
  
  get 'contact' => 'contact#index'
  post 'contact/confirm' => 'contact#confirm'
  post 'contact/thanks' => 'contact#thanks'
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
