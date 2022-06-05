class AddProductPriceToLineItem < ActiveRecord::Migration[6.1]
  def up
    LineItem.all.each do |line_item|
      line_item.price = line_item.product.price
      line_item.save!
    end
  end

  def down
    LineItem.all.each do |line_item|
      line_item.price = 0.00
      line_item.save!
    end
  end
end
