class CreateProductCatelogs < ActiveRecord::Migration[5.0]
  def change
    create_table :product_catelogs do |t|
      t.string :title
      t.string :description
      t.string :file_path
      t.timestamps
    end
  end
end
