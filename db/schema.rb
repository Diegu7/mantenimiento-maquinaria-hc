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

ActiveRecord::Schema.define(version: 20170511055439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "machine_areas", force: :cascade do |t|
    t.text "name"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machine_categories", force: :cascade do |t|
    t.text "name"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machine_sections", force: :cascade do |t|
    t.text "name"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", force: :cascade do |t|
    t.text "name"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "machine_category_id"
    t.bigint "machine_section_id"
    t.index ["machine_category_id"], name: "index_machines_on_machine_category_id"
    t.index ["machine_section_id"], name: "index_machines_on_machine_section_id"
  end

  create_table "mileage_logs", force: :cascade do |t|
    t.datetime "date"
    t.integer "hours"
    t.bigint "machine_id"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_mileage_logs_on_machine_id"
  end

  create_table "product_brands", force: :cascade do |t|
    t.text "name"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.text "name"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.integer "initial_stock"
    t.integer "current_stock"
    t.string "image_url"
    t.bigint "product_category_id"
    t.bigint "product_brand_id"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_brand_id"], name: "index_products_on_product_brand_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "programmed_maintenances", force: :cascade do |t|
    t.text "description"
    t.date "scheduled_date"
    t.integer "estimated_duration"
    t.text "comments"
    t.boolean "is_done"
    t.date "done_on"
    t.boolean "is_preventive"
    t.bigint "machine_id"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_programmed_maintenances_on_machine_id"
  end

  create_table "required_maintenances", force: :cascade do |t|
    t.text "description"
    t.integer "estimated_duration"
    t.bigint "machine_id"
    t.bigint "machine_area_id"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_area_id"], name: "index_required_maintenances_on_machine_area_id"
    t.index ["machine_id"], name: "index_required_maintenances_on_machine_id"
  end

  create_table "technical_specifications", force: :cascade do |t|
    t.text "key"
    t.text "value"
    t.bigint "machine_id"
    t.datetime "registered_at"
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_technical_specifications_on_machine_id"
  end

  add_foreign_key "machines", "machine_categories"
  add_foreign_key "machines", "machine_sections"
  add_foreign_key "mileage_logs", "machines"
  add_foreign_key "products", "product_brands"
  add_foreign_key "products", "product_categories"
  add_foreign_key "programmed_maintenances", "machines"
  add_foreign_key "required_maintenances", "machine_areas"
  add_foreign_key "required_maintenances", "machines"
  add_foreign_key "technical_specifications", "machines"
end
