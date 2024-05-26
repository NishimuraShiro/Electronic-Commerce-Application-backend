class SearchController < ApplicationController

  def index

    @q = Product.ransack(name_cont: params[:keyword])

    @products = @q.result.includes(:seller, order_details: :review) # :association_name は外部キーの関連名を指定

    render json: @products, include: [:seller,  order_details: :review]

  end

end

