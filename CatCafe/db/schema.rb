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

ActiveRecord::Schema.define(version: 20170329191704) do

  create_table "adoptions", primary_key: ["MemberID", "EmployeeID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "MemberID",   null: false
    t.integer "EmployeeID", null: false
    t.index ["EmployeeID"], name: "index_adoptions_on_EmployeeID", using: :btree
    t.index ["MemberID"], name: "index_adoptions_on_MemberID", using: :btree
  end

  create_table "bookings", primary_key: "BookingID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.time     "FromTime",   null: false
    t.time     "ToTime",     null: false
    t.date     "Date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "MemberID"
    t.integer  "RoomID"
    t.index ["MemberID"], name: "index_bookings_on_MemberID", using: :btree
    t.index ["RoomID"], name: "index_bookings_on_RoomID", using: :btree
  end

  create_table "cats", primary_key: "CatID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "CatName",     limit: 65535, null: false
    t.text     "CatPhotoUrl", limit: 65535
    t.text     "CatType",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "EmployeeID"
    t.index ["EmployeeID"], name: "index_cats_on_EmployeeID", using: :btree
  end

  create_table "employees", primary_key: "EmployeeID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "EName",      limit: 65535, null: false
    t.text     "EPassword",  limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "item_managers", primary_key: ["ManagerID", "ItemID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ManagerID", null: false
    t.integer "ItemID",    null: false
    t.index ["ItemID"], name: "index_item_managers_on_ItemID", using: :btree
    t.index ["ManagerID"], name: "index_item_managers_on_ManagerID", using: :btree
  end

  create_table "item_transactions", primary_key: "OrderID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "TransactionID"
    t.integer "ItemID"
    t.index ["ItemID"], name: "index_item_transactions_on_ItemID", using: :btree
    t.index ["TransactionID"], name: "index_item_transactions_on_TransactionID", using: :btree
  end

  create_table "items", primary_key: "ItemID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "Name",       null: false
    t.integer  "Price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", primary_key: "ManagerID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "EmployeeID"
    t.index ["EmployeeID"], name: "index_managers_on_EmployeeID", using: :btree
  end

  create_table "members", primary_key: "MemberID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "MName",      limit: 65535, null: false
    t.text     "MPassword",  limit: 65535, null: false
    t.text     "Email",      limit: 65535, null: false
    t.text     "PhoneNum",   limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rooms", primary_key: "RoomID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "Status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", primary_key: "TransactionID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "ReferenceID",  limit: 65535, null: false
    t.text     "Type",         limit: 65535, null: false
    t.datetime "Time",                       null: false
    t.integer  "TotalPayment",               null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "EmployeeID"
    t.index ["EmployeeID"], name: "index_transactions_on_EmployeeID", using: :btree
  end

  add_foreign_key "adoptions", "employees", column: "EmployeeID", primary_key: "EmployeeID", on_delete: :cascade
  add_foreign_key "adoptions", "members", column: "MemberID", primary_key: "MemberID", on_delete: :cascade
  add_foreign_key "bookings", "members", column: "MemberID", primary_key: "MemberID", on_delete: :cascade
  add_foreign_key "bookings", "rooms", column: "RoomID", primary_key: "RoomID", on_delete: :cascade
  add_foreign_key "cats", "employees", column: "EmployeeID", primary_key: "EmployeeID", on_delete: :cascade
  add_foreign_key "item_managers", "items", column: "ItemID", primary_key: "ItemID", on_delete: :cascade
  add_foreign_key "item_managers", "managers", column: "ManagerID", primary_key: "ManagerID", on_delete: :cascade
  add_foreign_key "item_transactions", "items", column: "ItemID", primary_key: "ItemID"
  add_foreign_key "item_transactions", "transactions", column: "TransactionID", primary_key: "TransactionID", on_delete: :cascade
  add_foreign_key "managers", "employees", column: "EmployeeID", primary_key: "EmployeeID", on_delete: :cascade
  add_foreign_key "transactions", "employees", column: "EmployeeID", primary_key: "EmployeeID", on_delete: :cascade
end
