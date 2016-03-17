class CompletesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @complete = @item.completes.build(user: current_user)

    if @complete.save
      @msg = "Complete item: #{@item.name}"
    else
      @msg = "Completing failed"
    end

    respond_to do |format|
      format.html { redirect_to user_show_path(current_user) }
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @complete = @item.completes.find(params[:id])

    if @complete.destroy
      @msg = "Incomplete item: #{@item.name}"
    else
      @msg = "Incompleting failed"
    end

    respond_to do |format|
      format.html { redirect_to user_show_path(current_user) }
      format.js
    end
  end
end
