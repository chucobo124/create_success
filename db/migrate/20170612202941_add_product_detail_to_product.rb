class AddProductDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :product_detail, index: true
  end
end
