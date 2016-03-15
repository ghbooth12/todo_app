class ItemsController < ApplicationController
  def create
    @item = current_user.items.build(item_params)
    @new_item = Item.new

    if @item.save
      notice = "Saved! New to-do item: #{@item.name}" # NOT working
      redirect_to root_path
    else
      alert = "There was an error creating an item. Please try again."
      redirect_to root_path
    end

    # If using Ajax
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
