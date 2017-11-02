class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Way to go! your review has been created!' }
        format.json { render :show, status: :created, location: @product }
        
      else
        format.html { redirect_to @product, alert: 'Oh no! make sure to write a review and rate it before clicking on submit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product 
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end

end