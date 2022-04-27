class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = current_user.comments.new(comment_params)
    @comment.product_id = @product.id
    if @comment.save
      flash.now[:notice] = "コメントを投稿しました"
      render :product_comments
    else
      render "products/show"
    end
  end

  def destroy
    Comment.find_by(id: params[:id], product_id: params[:product_id]).destroy
    flash.now[:alert] = "投稿を消去しました"
    @product = Product.find(params[:product_id])
    render :product_comments
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
