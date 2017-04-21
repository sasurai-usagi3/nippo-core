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

ActiveRecord::Schema.define(version: 20170420155712) do

  create_table "nippo_core_group_member_relations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "member_id",                      null: false
    t.integer  "group_id",                       null: false
    t.integer  "authentication", default: 0,     null: false
    t.boolean  "status",         default: false, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["group_id"], name: "index_nippo_core_group_member_relations_on_group_id", using: :btree
    t.index ["member_id"], name: "index_nippo_core_group_member_relations_on_member_id", using: :btree
  end

  create_table "nippo_core_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                      null: false
    t.text     "description", limit: 65535
    t.integer  "creator_id",                null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["creator_id"], name: "index_nippo_core_groups_on_creator_id", using: :btree
  end

  create_table "nippo_core_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                   null: false
    t.integer  "group_id",                  null: false
    t.date     "reported_at",               null: false
    t.text     "body",        limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["group_id"], name: "index_nippo_core_reports_on_group_id", using: :btree
    t.index ["user_id"], name: "index_nippo_core_reports_on_user_id", using: :btree
  end

  create_table "nippo_core_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "nickname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_nippo_core_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_nippo_core_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "nippo_core_group_member_relations", "nippo_core_groups", column: "group_id"
  add_foreign_key "nippo_core_group_member_relations", "nippo_core_users", column: "member_id"
  add_foreign_key "nippo_core_groups", "nippo_core_users", column: "creator_id"
  add_foreign_key "nippo_core_reports", "nippo_core_groups", column: "group_id"
  add_foreign_key "nippo_core_reports", "nippo_core_users", column: "user_id"
end
