class ReviewController < ApplicationController
  #レビュー情報作成
  def create_review
    # パラメータからデータを取得
    point = params[:point]
    title = params[:title]
    picture_path = params[:picture_path]
    contents = params[:contents]
    order_detail_id = params[:order_detail_id]  # 新しく追加

    # Reviewテーブルに新しい要素を作成（order_detail_idを設定）
    @review = Review.new(
      point: point,
      title: title,
      picture_path: picture_path,
      contents: contents,
      order_detail_id: order_detail_id  # 新しく追加
    )

    if @review.save
      render json: @review, status: :created
    else
      render json: { error: "Reviewの作成に失敗しました" }, status: :unprocessable_entity
    end
  end
end
