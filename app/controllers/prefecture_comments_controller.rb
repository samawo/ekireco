class PrefectureCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @prefecture_comment = current_user.prefecture_comments.build(prefecture_comment_params)
    @prefecture = @prefecture_comment.prefecture
    # respond_toは、クライアントからの要求に応じてレスポンスのフォーマットを変更します。
    respond_to do |format|
      if @prefecture_comment.save
        format.html { redirect_to prefecture_path(@prefecture), notice: 'コメントを投稿しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    @prefecture_comment=PrefectureComment.find(params[:id])
    @prefecture=@prefecture_comment.prefecture
  end

  def update
    @prefecture_comment=PrefectureComment.find(params[:id])
    @prefecture_comment.update(prefecture_comment_params)
    @prefecture=@prefecture_comment.prefecture
    respond_to do |format|
      if @prefecture_comment.save
        format.html { redirect_to prefecture_path(@prefecture), notice: 'コメントを編集しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end
  
  def destroy
    @prefecture_comment = PrefectureComment.find(params[:id])
    respond_to do |format|
      if @prefecture_comment.destroy
        format.html { redirect_to prefecture_path(@prefecture), notice: 'コメントを削除しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  private
    # ストロングパラメーター
    def prefecture_comment_params
      params.require(:prefecture_comment).permit(:prefecture_id, :content)
    end
end
