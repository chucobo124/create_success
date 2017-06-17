class AddProductIndexToProductDetails < ActiveRecord::Migration[5.0]
  def change
    add_reference :product_details, :product, index: true
  end
end
