class ToppagesController < ApplicationController
  def index
    @items = Item.order(updated_at: :desc)
  end
end
