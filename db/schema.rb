# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_07_024338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifts", force: :cascade do |t|
    t.integer "gift_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_gifts", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "gift_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gift_id"], name: "index_order_gifts_on_gift_id"
    t.index ["order_id"], name: "index_order_gifts_on_order_id"
  end

  create_table "order_recipients", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "recipient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_recipients_on_order_id"
    t.index ["recipient_id"], name: "index_order_recipients_on_recipient_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.integer "workflow_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_orders_on_school_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_recipients_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "order_gifts", "gifts"
  add_foreign_key "order_gifts", "orders"
  add_foreign_key "order_recipients", "orders"
  add_foreign_key "order_recipients", "recipients"
  add_foreign_key "orders", "schools"
  add_foreign_key "recipients", "schools"
end
