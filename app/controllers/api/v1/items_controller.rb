class Api::V1::ItemsController < Api::V1::ApiController

  def index
    @items = []
    n = params[:limit].blank? ? rand(2..25) : [params[:limit].to_i, 50].min
    n.times do
      @items << generate_item(nil, params[:user_id])
    end
    respond_with @items
  end

  def show
    respond_with generate_item(params[:id], params[:user_id])
  end
  
protected
  
  def generate_item(id = nil, user_id = nil)
    {
      id: id.blank? ? rand(1..10000000) : id.to_i,
      title: Faker::Commerce.product_name,
      category: Faker::Commerce.department,
      color: Faker::Commerce.color.titleize,
      code: Faker::Code.isbn,
      user_id: user_id.blank? ? rand(1..10000) : user_id.to_i,
      created_at: rand(2.years).ago
    }
  end
  
end