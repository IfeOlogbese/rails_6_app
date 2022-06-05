class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def total_price
    line_items.to_a.sum(&:total_price)
  end

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
      current_item.price = product.price
    else
      current_item = line_items.build(product_id: product.id, price: product.price)
    end
    logger.info "current_item => #{current_item.inspect}"
    current_item
  end
end
