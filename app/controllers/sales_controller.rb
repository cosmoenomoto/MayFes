
class SalesController < ApplicationController
  def index
    # 記録画面（ボタンを並べる）
    @sales = Sale.order(created_at: :desc).limit(5) # 直近5件だけ表示用
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to root_path, notice: "記録しました！"
    else
      redirect_to root_path, alert: "保存に失敗しました"
    end
  end

  def manage
    # 管理・分析画面
    @sales = Sale.all.order(created_at: :desc)
    @total_amount = @sales.sum(:price)
    # ここに「性別比」などの集計ロジックを後で追加できます
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to manage_sales_path, notice: "削除しました"
  end

  private

  def sale_params
    params.require(:sale).permit(:item_type, :gender, :age_group, :price)
  end
end