class RouteCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @route_comment = current_user.route_comments.build(route_comment_params)
    @route = @route_comment.route
    # respond_toは、クライアントからの要求に応じてレスポンスのフォーマットを変更します。
    respond_to do |format|
      if @route_comment.save
        format.html { redirect_to route_path(@route), notice: 'コメントを投稿しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    @route_comment=RouteComment.find(params[:id])
    @route=@route_comment.route
  end

  def update
    @route_comment=RouteComment.find(params[:id])
    @route_comment.update(route_comment_params)
    @route=@route_comment.route
    respond_to do |format|
      if @route_comment.save
        format.html { redirect_to route_path(@route), notice: 'コメントを編集しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end
  
  def destroy
    @route_comment = RouteComment.find(params[:id])
    respond_to do |format|
      if @route_comment.destroy
        format.html { redirect_to route_path(@route), notice: 'コメントを削除しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  private
    # ストロングパラメーター
    def route_comment_params
      params.require(:route_comment).permit(:route_id, :content)
    end
end
