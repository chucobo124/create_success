class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :sku, null: false
      t.string :description, null: false
      t.references :spec, index: true
      t.references :standard_accessorie, index: true
      t.references :optional_accessorie, index: true
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
