module Api::V1
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show update destroy ]
    protect_from_forgery with: :null_session

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
      @product = @region.products.new(product_params)

      if @product.save
        render :show, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      if @region.products.update(product_params)
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

      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:title, :image, :description, :price, :sku, :stock_number)
      end
  end
end
