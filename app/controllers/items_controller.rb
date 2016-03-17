class ItemsController < ApplicationController
  def create
    @item = current_user.items.build(item_params)
    @new_item = Item.new

    if @item.save
      @msg = "Saved! New Item: #{@item.name}"
    else
      @msg = 'Item failed to save.'
    end

    respond_to do |format|
      format.html { redirect_to user_show_path(current_user) }
      format.js
    end
  end

  def destroy_multiple
    @items = current_user.items.select {|i| i.completes.any? }
    
    if @items.each {|i| i.destroy }
      @msg = "Deleted! Item(s): " + @items.map(&:name).join(', ')
    else
      @msg = 'Item failed to delete'
    end

    respond_to do |format|
      format.html { redirect_to user_show_path(current_user) }
      format.js
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
