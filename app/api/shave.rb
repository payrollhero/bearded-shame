require 'grape-swagger'

module Shave
  class API < Grape::API
    version 'v1', using: :header, vendor: 'shave'
    format :json
    prefix :api
    add_swagger_documentation


    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    resource :massage do
      desc "Return a favorite massage."
      get do
        authenticate!
        current_user.user_favorite_massage
      end

      desc "Set a favorite massage."
      params do
        requires :id, type: Integer, desc: "MassageType id."
      end
      put do
        authenticate!
        current_user.user_favorite_massage = params[:id]
      end
    end

    resource :orders do
      desc "Return an orders list."
      get do
        Order.limit(10)
      end

      desc "Return a personal orders."
      get :my do
        authenticate!
        current_user.orders.limit(20)
      end
    end

    resource :shaves do
      desc "Return a price list"
      get :price do
        Price.all
      end

      desc "Add shave"
      params do
        requires :id, type: Integer, desc: "User ID."
        requires :shave_id, type: Integer, desc: "Shave ID"
        requires :massage_id, type: Integer, desc: "Massage Type ID"
        requires :length, type: Integer, desc: "Length to cut"
      end

      post 'new' do
        authenticate!
        cost = MassageType.find_by_id(params[:massage_id]).cost

        begin
          if shave_id > 1
            BeardTrimmer::WithMassage.trim(
              current_user.id, length, massage_type
            )
          else
            BeardTrimmer.trim(current_user.id, length)
          end

          Order.create!({
                          user: current_user.id,
                          shave_id: params[:shave_id],
                          massage_id: params[:massage_id],
                          cost: cost
                        })
        rescue Exception
          error! t(:wrong), 401
        end
      end
    end
  end
end
