module Api::V1
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show update destroy ]
    # before_action :set_region, only: %i[ create update ] disabled this for now
    before_action :authenticate_user!, only: [:create, :update, :destroy]
    before_action :authenticate_admin!, only: [:create, :update, :destroy]

    # GET /products
    # GET /products.json
    def index
      @products = Product.all
    end

    # GET /products/1
    # GET /products/1.json
    def show
    end

    # POST /products
    # POST /products.json
    def create
      @product = Product.new(product_params)

      if @product.save
        render :show, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      if @product.update(product_params)
        render :show, status: :ok
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
      @product.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      def authenticate_admin!
        unless user_signed_in? && current_user.admin.present?
          render json: {message: 'Only Admins can perform this action' }, status: :unprocessable_entity
        end
      end

      # def set_region
      #   @region = Region.find(params[:region_id])
      #   Incase we'll choose to build the product from a region record
      # end

      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:title, :image, :description, :price, :sku, :stock_number, :region_id)
      end
  end
end
