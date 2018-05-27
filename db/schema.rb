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

ActiveRecord::Schema.define(version: 20180527044547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cardboards", force: :cascade do |t|
    t.string "cardboard_type"
    t.decimal "price", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "cardboard_id"
    t.integer "quantity", default: 0
    t.decimal "price", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cardboard_id"], name: "index_line_items_on_cardboard_id"
    t.index ["order_id", "cardboard_id"], name: "index_line_items_on_order_id_and_cardboard_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "item_count", default: 0, null: false
    t.decimal "item_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "shipment_total", precision: 10, scale: 2, default: "30.0", null: false
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "grand_total", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "order_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_promotions", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "promotion_id", null: false
    t.index ["order_id"], name: "index_orders_promotions_on_order_id"
    t.index ["promotion_id"], name: "index_orders_promotions_on_promotion_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.integer "promotion_type", null: false
    t.decimal "discount_amount", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "requirement_field", default: 0, null: false
    t.integer "requirement_operator", default: 0, null: false
    t.integer "requirement_amount", default: 0, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
