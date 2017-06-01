class CreateProductSpecs < ActiveRecord::Migration[5.0]
  def change
    create_table :product_specs do |t|
      t.string :maximum_diameter_grab_items
      t.string :distance_between_centers
      t.string :swing_over_bed
      t.string :swing_over_cross_slide
      t.string :taper_of_spindle_bore
      t.string :spindle_bore
      t.string :step_of_spindle_speeds
      t.string :range_of_spindle_speeds
      t.string :range_of_inch_threads
      t.string :range_of_metric_theads
      t.string :top_slide_travel
      t.string :cross_slide_travel
      t.string :tailstock_quil_travel
      t.string :taper_of_tailstock_quill
      t.string :motor
      t.string :overall_dimension
      t.string :net_weight
      t.string :other_data
      t.timestamps
    end
  end
end
