class ItemsController < ApplicationController
  def new
    @items = []
    @keyword = params[:keyword]
    if @keyword
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })
      results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end
  end

  private
  def read(result)
    code = result.code
    name = result.name
    url  = result.url
    image_url = result.medium_image_urls.first['imageUrl'].gsub('?_ex=128x128', '')

    return {
      code: code,
      name: name,
      url: url,
      image_url: image_url,
    }
  end
end
