class AddAssetToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :asset, :string
  end
end
