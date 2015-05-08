require 'grape-swagger'
require 'beard_trimmer'
require 'beard_trimmer/with_massage'

module Shave
  class API < Grape::API
    version 'v1', using: :header, vendor: 'shave'
    format :json
    prefix :api
    rescue_from :all
    add_swagger_documentation

    helpers do
      def current_user
        @current_user ||= User.first
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    resource :massages do
      desc "Return a massages list"
      get do
        MassageType.all
      end
    end

    resource :user do
      desc "Return a favorite massage."
      get :massage do
        authenticate!
        current_user.user_favorite_massage
      end

      desc "Set a favorite massage."
      params  do
        requires :id, type: Integer, desc: "MassageType id."
      end
      put :massage do
        authenticate!
        current_user.user_favorite_massage = params[:id]
      end
    end

    resource :orders do
      desc "Return a price list"
      get :price do
        Price.all
      end

      desc "Return an orders list."
      get do
        Order.limit(10)
      end

      desc "Return a personal orders."
      get :my do
        authenticate!
        current_user.orders.limit(20)
      end

      desc "Add shave"
      params do
        requires :shave_id, type: Integer, desc: "Shave ID"
        requires :massage_id, type: Integer, desc: "Massage Type ID"
        requires :length, type: Integer, desc: "Length to cut"
      end

      post 'new' do
        authenticate!
        cost = Price.find_by_id(params[:shave_id]).cost
        length = params[:length]
        massage_type = params[:massage_id]

        begin
          case params[:shave_id]
            when 1
              error! I18n.t(:drunk), 401
            when 2
              BeardTrimmer.trim(current_user, length)
            else
              binding.pry
              BeardTrimmer::WithMassage.trim(current_user, length, massage_type)
          end

          Order.create!({
                          user_id: current_user.id,
                          shave_id: params[:shave_id],
                          massage_type_id: massage_type,
                          cost: cost
                        })
        rescue Exception
          error! I18n.t(:wrong), 401
        end
      end
    end
  end
end
