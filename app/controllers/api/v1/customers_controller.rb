module Api::V1
  class CustomersController < ApplicationController
    before_action :set_customer, only: %i[ show update destroy ]
    protect_from_forgery with: :null_session
    before_action :authenticate_user!

    # GET /customers
    # GET /customers.json
    def index
      @customers = Customer.all
    end

    # GET /customers/1
    # GET /customers/1.json
    def show
    end

    # POST /customers
    # POST /customers.json
    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        render :show, status: :created
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /customers/1
    # PATCH/PUT /customers/1.json
    def update
      if @customer.update(customer_params)
        render :show, status: :ok
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    # DELETE /customers/1
    # DELETE /customers/1.json
    def destroy
      @customer.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_customer
        @customer = Customer.find(params[:id])
        # will eventually replace this with current_user.customer
      end

      # Only allow a list of trusted parameters through.
      def customer_params
        params.require(:customer).permit(:first_name, :last_name, :email)
      end
  end
end
