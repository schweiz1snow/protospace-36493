class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
      # @comment.prototypeはURIパターン/prototypes/:id(.:format) のid部分のこと
    else
      @prototype = Prototype.new
      @prototype = Prototype.find(params[:prototype_id])
      # ネストすることでルーティングが変わるので注意 例 @item = Item.find(params[:item_id])
      @manycomment = @prototype.comments
      render template: "prototypes/show"
      # renderはあくまで画面遷移なので、ルーティングしない、コントローラーも介さない → なのでインスタンス変数を定義する必要がある
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
