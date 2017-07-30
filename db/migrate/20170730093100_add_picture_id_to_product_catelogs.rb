class AddPictureIdToProductCatelogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :product_catelogs, :pictures, index: true
  end
end
