module Api::V1
  class OrdersController < ApplicationController
    before_action :set_order, only: %i[ show update destroy ]
    before_action :authenticate_user!
    before_action :authenticate_admin!, only: [:show, :index]
    protect_from_forgery with: :null_session
    # GET /orders
    # GET /orders.json
    def index
      @orders = Order.all
    end

    # GET /orders/1
    # GET /orders/1.json
    def show
    end

    # POST /orders
    # POST /orders.json
    def create
      @order = Order.new(order_params)
      if @order.save
        #check Order model for this custom methods
        render :show, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /orders/1
    # PATCH/PUT /orders/1.json
    def update
      if @order.update(order_params)
        render :show, status: :ok
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    # DELETE /orders/1
    # DELETE /orders/1.json
    def destroy
      @order.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      def authenticate_admin!
        unless user_signed_in? && current_user.admin.present?
          render json: {message: 'Only Admins can perform this action' }, status: :unprocessable_entity
        end
      end

      # Only allow a list of trusted parameters through.
      def order_params
        params.require(:order).permit(:full_name, :email, :total_amount, :customer_id)
      end
  end
end
