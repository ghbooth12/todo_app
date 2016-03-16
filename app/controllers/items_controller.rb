class ItemsController < ApplicationController
  def create
    @item = current_user.items.build(item_params)
    @new_item = Item.new
    @item.save
    
    flash[:notice] = "Saved! New Item: #{@item.name}"
    flash[:alert] = "Item failed to save."

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
