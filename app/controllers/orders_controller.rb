class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @cart = current_cart
    @orders = Order.where(cart_id: @cart.id)
    @order=@orders.first
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @cart = current_cart
    @product = Product.find(params[:product_id])
    @order = Order.add_product(@product, @cart)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'Add new item in your cart:' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    if Order.all.empty?
      @cart = current_cart
      @cart.destroy
      respond_to do |format|
        format.html { redirect_to menu_path, notice: 'Cart is empty!' }
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to orders_url }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @cart = current_cart
      @order = Order.find(params[:id])
      @orders = Order.where("cart_id=? AND id<>?", @cart.id, params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:count, :sum, :discount_sum, :weight, :note, :image_url)
    end
end
