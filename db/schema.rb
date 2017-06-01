# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170601110314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "product_specs", force: :cascade do |t|
    t.string   "maximum_diameter_grab_items"
    t.string   "distance_between_centers"
    t.string   "swing_over_bed"
    t.string   "swing_over_cross_slide"
    t.string   "taper_of_spindle_bore"
    t.string   "spindle_bore"
    t.string   "step_of_spindle_speeds"
    t.string   "range_of_spindle_speeds"
    t.string   "range_of_inch_threads"
    t.string   "range_of_metric_theads"
    t.string   "top_slide_travel"
    t.string   "cross_slide_travel"
    t.string   "tailstock_quil_travel"
    t.string   "taper_of_tailstock_quill"
    t.string   "motor"
    t.string   "overall_dimension"
    t.string   "net_weight"
    t.string   "other_data"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "spec_id"
    t.integer  "standard_accessorie_id"
    t.integer  "optional_accessorie_id"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["imageable_type", "imageable_id"], name: "index_products_on_imageable_type_and_imageable_id", using: :btree
    t.index ["optional_accessorie_id"], name: "index_products_on_optional_accessorie_id", using: :btree
    t.index ["spec_id"], name: "index_products_on_spec_id", using: :btree
    t.index ["standard_accessorie_id"], name: "index_products_on_standard_accessorie_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
