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

ActiveRecord::Schema.define(version: 20160731192642) do

  create_table "free_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                           default: "",    null: false
    t.string   "image_url"
    t.string   "video_url"
    t.text     "short_description", limit: 65535,                 null: false
    t.string   "duration"
    t.boolean  "featured",                        default: false, null: false
    t.boolean  "active",                          default: true,  null: false
    t.text     "long_description",  limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "paid_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                            default: "",    null: false
    t.string   "image_url"
    t.string   "video_url"
    t.text     "short_description",   limit: 65535,                                null: false
    t.string   "duration"
    t.boolean  "featured",                                         default: false, null: false
    t.boolean  "active",                                           default: true,  null: false
    t.text     "long_description",    limit: 65535
    t.decimal  "price",                             precision: 10,                 null: false
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.integer  "preorder_project_id"
    t.index ["preorder_project_id"], name: "index_paid_projects_on_preorder_project_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "paymentable_type"
    t.integer  "paymentable_id"
    t.integer  "user_id"
    t.decimal  "amount",           precision: 10, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["paymentable_type", "paymentable_id"], name: "index_payments_on_paymentable_type_and_paymentable_id", using: :btree
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "preorder_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                          default: "",    null: false
    t.string   "image_url"
    t.string   "video_url"
    t.text     "short_description", limit: 65535,                                null: false
    t.string   "duration"
    t.boolean  "featured",                                       default: false, null: false
    t.boolean  "active",                                         default: true,  null: false
    t.text     "long_description",  limit: 65535
    t.string   "release_date"
    t.decimal  "original_price",                  precision: 10,                 null: false
    t.decimal  "preorder_price",                  precision: 10,                 null: false
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ratingable_type"
    t.integer  "ratingable_id"
    t.integer  "user_id"
    t.integer  "note",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["ratingable_type", "ratingable_id"], name: "index_ratings_on_ratingable_type_and_ratingable_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "steps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                        default: "", null: false
    t.integer  "type"
    t.string   "video_url"
    t.string   "video_duration"
    t.string   "slug"
    t.text     "explanations",   limit: 65535
    t.integer  "order",                                     null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "task_id"
    t.index ["task_id"], name: "index_steps_on_task_id", using: :btree
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "subscriptionable_type"
    t.integer  "subscriptionable_id"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["subscriptionable_type", "subscriptionable_id"], name: "index_subscriptions_on_subsable_type_and_subsable_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description",   limit: 65535
    t.integer  "order"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "taskable_type"
    t.integer  "taskable_id"
    t.index ["taskable_type", "taskable_id"], name: "index_tasks_on_taskable_type_and_taskable_id", using: :btree
  end

  create_table "upcoming_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                           default: "",    null: false
    t.string   "image_url"
    t.string   "video_url"
    t.text     "short_description", limit: 65535,                 null: false
    t.string   "duration"
    t.boolean  "featured",                        default: false, null: false
    t.boolean  "active",                          default: true,  null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "paid_projects", "preorder_projects"
  add_foreign_key "payments", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "steps", "tasks"
  add_foreign_key "subscriptions", "users"
end
