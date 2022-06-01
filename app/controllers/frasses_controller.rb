class FrassesController < ApplicationController

  def index
    @frasses = Frasse.all
  end

  def new
    @frasse = Frasse.new
  end

  def create
    # Frasse.create(params.require(:frasse).permit(:title,:content))
    @frasse = Frasse.new(frasse_params)
    if @frasse.save
      redirect_to new_frasses_paht, notice: "Fraseを作成しました！"
    else
      render:new
    end
  end

  def show
    @frasse = Frasse.find(params[:id])
  end

  def edit
    @frasse = Frasse.find(params[:id])
  end

  def update
    @frasse = Frasse.find(params[:id])
    if @frasse.update(frasse_params)
      redirect_to frasses_path, notice: "Fraseを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @frasse = Frasse.find(params[:id])
    @frasse.destroy
    redirect_to frasses_path, notice: "Fraseを削除しました"
  end


  private

  def frasse_params
    params.require(:frasse).permit(:content)
  end
end
