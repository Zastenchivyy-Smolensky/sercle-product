class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to product_path(@product), notice:"プロダクトを投稿しました."
    else
      render :new
    end
  end
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comment = current_user.comments.build
    @comments = @product.comments
  end
  def edit 
    @product = Product.find(params[:id])
    if @product.user != current_user
      redirect_to product_path, alert: "不正なアクセスです"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "プロダクトを編集しました"
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to user_path(product.user), notice: "プロダクトを削除しました。"
  end

  private
    def product_params
      params.require(:product).permit(:title, :content, :tech, :span, :image)
    end
end
