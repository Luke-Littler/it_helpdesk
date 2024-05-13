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

ActiveRecord::Schema[7.1].define(version: 2024_05_01_161918) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.bigint "user_id"
    t.bigint "operator_id"
    t.bigint "specialist_id"
    t.index ["operator_id"], name: "index_accounts_on_operator_id"
    t.index ["specialist_id"], name: "index_accounts_on_specialist_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "equipment", force: :cascade do |t|
    t.string "serial_number"
    t.string "make"
    t.string "model"
    t.string "operating_system"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment_software_products", force: :cascade do |t|
    t.bigint "equipment_id"
    t.bigint "software_product_id"
    t.index ["equipment_id", "software_product_id"], name: "index_software_products_on_equipment_id_and_software_product_id"
    t.index ["software_product_id", "equipment_id"], name: "index_software_products_on_software_product_id_and_equipment_id"
  end

  create_table "operators", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poly_notes", force: :cascade do |t|
    t.text "note"
    t.string "notable_type"
    t.bigint "notable_id"
    t.bigint "user_id"
    t.bigint "operator_id"
    t.bigint "specialist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notable_type", "notable_id"], name: "index_poly_notes_on_notable"
    t.index ["operator_id"], name: "index_poly_notes_on_operator_id"
    t.index ["specialist_id"], name: "index_poly_notes_on_specialist_id"
    t.index ["user_id"], name: "index_poly_notes_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.integer "problem_type"
    t.integer "problem_sub_type"
    t.integer "status", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "operator_id", default: 1
    t.bigint "user_id"
    t.bigint "equipment_id"
    t.bigint "specialist_id", default: 1
    t.index ["equipment_id"], name: "index_problems_on_equipment_id"
    t.index ["operator_id"], name: "index_problems_on_operator_id"
    t.index ["specialist_id"], name: "index_problems_on_specialist_id"
    t.index ["user_id"], name: "index_problems_on_user_id"
  end

  create_table "problems_specialists", force: :cascade do |t|
    t.bigint "problem_id"
    t.bigint "specialist_id"
    t.index ["problem_id", "specialist_id"], name: "index_problem_specialists_on_problem_id_and_specialist_id"
    t.index ["specialist_id", "problem_id"], name: "index_problem_specialists_on_specialist_id_and_problem_id"
  end

  create_table "software_products", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.string "licence_number"
    t.datetime "licence_exp_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialists", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.integer "specialist_type"
    t.integer "specialist_sub_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "job_title"
    t.string "department"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "equipment_software_products", "equipment"
  add_foreign_key "equipment_software_products", "software_products"
  add_foreign_key "poly_notes", "operators"
  add_foreign_key "poly_notes", "specialists"
  add_foreign_key "poly_notes", "users"
  add_foreign_key "problems", "equipment"
  add_foreign_key "problems", "operators"
  add_foreign_key "problems", "specialists"
  add_foreign_key "problems", "users"
  add_foreign_key "problems_specialists", "problems"
  add_foreign_key "problems_specialists", "specialists"
  add_foreign_key "accounts", "operators"
  add_foreign_key "accounts", "specialists"
  add_foreign_key "accounts", "users"
  
end
