class StationCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @station_comment = current_user.station_comments.build(station_comment_params)
    @station = @station_comment.station
    # respond_toは、クライアントからの要求に応じてレスポンスのフォーマットを変更します。
    respond_to do |format|
      if @station_comment.save
        format.html { redirect_to station_path(@station), notice: 'コメントを投稿しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end
  
  def destroy
    @station_comment = StationComment.find(params[:id])
    respond_to do |format|
      if @station_comment.destroy
        format.html { redirect_to station_path(@station), notice: 'コメントを削除しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  private
    # ストロングパラメーター
    def station_comment_params
      params.require(:station_comment).permit(:station_id, :content)
    end
end
