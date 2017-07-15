class CreateProductCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :product_categories do |t|
      t.string :title
      t.string :description
      t.references :product, index: true
      t.timestamps
    end
    add_reference :products, :product_category, index: true
  end
end
