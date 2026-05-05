class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_product, only: %i[show edit update destroy]
  def index
    @products = Product.all
  end
  # displaying individual products
  def show
    @product = Product.find(params[:id])
  end
  # process of adding and saving a new product
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end
# end of the process


# process of editing and updating information
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end
# end of the process

# deleting data
def destroy
  @product.destroy
  redirect_to product_path
end

  # this is a params action that protects our app from being hacked
private
    def set_product
      @product = Product.find(params[:id])
    end

        # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name, :description, :featured_image ])
    end

end
