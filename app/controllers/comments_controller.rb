class CommentsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    comment = current_user.comments.build(comment_params)
    comment.product_id = product.id
    comment.save
    redirect_to product_path(product.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to products_path
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
