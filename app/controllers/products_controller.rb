class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q]
    search_term = params[:q]
    @products = Product.search(search_term)
    else
    @products = Product.all
    end
    @products = @products.paginate(:page => params[:page], :per_page=>4)
  end

  def show
    @comments = @product.comments.paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
  end

  def new
    if(current_user && current_user.admin)
      @product = Product.new
    else
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

  def edit
    unless(current_user && current_user.admin)
      redirect_to root_path, alert: "You are not authorized to access this page."

    end

  end

  def create
    @product = Product.new(product_params)

    unless(current_user && current_user.admin)
     return redirect_to root_path, alert: "You are not authorized to access this page."
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to "/products/#{@product.id}", notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    unless(current_user && current_user.admin)
     return redirect_to root_path, alert: "You are not authorized to access this page."
    end    
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Awesome! your product has been updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    unless(current_user && current_user.admin)
     return redirect_to root_path, alert: "You are not authorized to access this page."
    end   
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Your product has been destroyed, BOOM!' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :image_url, :colour, :price)
    end
end
