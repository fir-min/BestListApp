class ItemsController < ApplicationController
  before_action :set_list
  before_filter :authenticate_user!


  def create
    @item = @list.items.create(item_params)
    redirect_to user_list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @item = Item.find_by_list_id(@list)
    if @item.destroy
      flash[:sucess] = "It's been deleted :-("
    else
      flash[:error] = "could not delete :-("
    end
    redirect_to user_list_path(@list)
  end

  private 

  def set_list
    user = User.find(params[:list_id])
    @list = List.find_by_user_id(user)
  end

  def item_params
    params[:item].permit(:label)
  end
end
