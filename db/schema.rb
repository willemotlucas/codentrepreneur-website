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

ActiveRecord::Schema.define(version: 20160814165413) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "namespace"
    t.text     "body",          limit: 65535
    t.string   "resource_id",                 null: false
    t.string   "resource_type",               null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "free_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                           null: false
    t.string   "image_url"
    t.string   "video_url"
    t.text     "short_description", limit: 65535,                 null: false
    t.string   "duration"
    t.boolean  "featured",                        default: false, null: false
    t.boolean  "active",                          default: true,  null: false
    t.text     "long_description",  limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "slug"
    t.string   "tags_list"
    t.index ["slug"], name: "index_free_projects_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "paid_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                                                     null: false
    t.string   "image_url"
    t.string   "video_url"
    t.text     "short_description",   limit: 65535,                                         null: false
    t.string   "duration"
    t.boolean  "featured",                                                  default: false, null: false
    t.boolean  "active",                                                    default: true,  null: false
    t.text     "long_description",    limit: 65535
    t.decimal  "price",                             precision: 5, scale: 2,                 null: false
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.integer  "preorder_project_id"
    t.string   "slug"
    t.string   "tags_list"
    t.index ["preorder_project_id"], name: "index_paid_projects_on_preorder_project_id", using: :btree
    t.index ["slug"], name: "index_paid_projects_on_slug", unique: true, using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "paymentable_type"
    t.integer  "paymentable_id"
    t.integer  "user_id"
    t.decimal  "amount",                 precision: 5, scale: 2, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "stripe_charge_id"
    t.string   "referral_code"
    t.decimal  "referral_wallet_amount", precision: 5, scale: 2
    t.index ["paymentable_id", "paymentable_type", "user_id"], name: "index_payments_on_paymentable_id_and_type_and_user", unique: true, using: :btree
    t.index ["paymentable_type", "paymentable_id"], name: "index_payments_on_paymentable_type_and_paymentable_id", using: :btree
    t.index ["referral_code"], name: "index_payments_on_referral_code", using: :btree
    t.index ["user_id", "referral_code"], name: "index_payments_on_user_id_and_referral_code", unique: true, using: :btree
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "preorder_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                                                   null: false
    t.string   "image_url"
    t.string   "video_url"
    t.text     "short_description", limit: 65535,                                         null: false
    t.string   "duration"
    t.boolean  "featured",                                                default: false, null: false
    t.boolean  "active",                                                  default: true,  null: false
    t.text     "long_description",  limit: 65535
    t.string   "release_date"
    t.decimal  "original_price",                  precision: 5, scale: 2,                 null: false
    t.decimal  "preorder_price",                  precision: 5, scale: 2,                 null: false
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.string   "slug"
    t.string   "tags_list"
    t.integer  "quantity",                                                default: -1
    t.index ["slug"], name: "index_preorder_projects_on_slug", unique: true, using: :btree
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ratingable_type"
    t.integer  "ratingable_id"
    t.integer  "user_id"
    t.integer  "note",                          null: false
    t.text     "comment",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["ratingable_id", "ratingable_type", "user_id"], name: "index_ratings_on_ratingable_id_and_ratingable_type_and_user_id", unique: true, using: :btree
    t.index ["ratingable_type", "ratingable_id"], name: "index_ratings_on_ratingable_type_and_ratingable_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "steps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                        null: false
    t.string   "step_type",      limit: 12
    t.string   "video_url"
    t.string   "video_duration"
    t.string   "slug"
    t.text     "explanations",   limit: 65535
    t.integer  "step_order",                   null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "task_id"
    t.index ["slug"], name: "index_steps_on_slug", unique: true, using: :btree
    t.index ["task_id"], name: "index_steps_on_task_id", using: :btree
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "subscriptionable_type"
    t.integer  "subscriptionable_id"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["subscriptionable_type", "subscriptionable_id", "user_id"], name: "index_subscriptions_on_subsable_type_and_subsable_id_and_user", unique: true, using: :btree
    t.index ["subscriptionable_type", "subscriptionable_id"], name: "index_subscriptions_on_subsable_type_and_subsable_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                       null: false
    t.text     "description",   limit: 65535
    t.integer  "task_order",                  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "taskable_type"
    t.integer  "taskable_id"
    t.index ["taskable_id", "taskable_type", "task_order"], name: "index_tasks_on_taskable_id_and_taskable_type_and_task_order", unique: true, using: :btree
    t.index ["taskable_type", "taskable_id"], name: "index_tasks_on_taskable_type_and_taskable_id", using: :btree
  end

  create_table "upcoming_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                           null: false
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
    t.string   "email",                                                                    null: false
    t.string   "encrypted_password",                                                       null: false
    t.string   "first_name",                                                               null: false
    t.string   "last_name",                                                                null: false
    t.string   "user_role",              limit: 6
    t.string   "referral_code",                                                            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                            default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.decimal  "referral_wallet",                  precision: 5, scale: 2, default: "0.0"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["referral_code"], name: "index_users_on_referral_code", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "paid_projects", "preorder_projects"
  add_foreign_key "payments", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "steps", "tasks"
  add_foreign_key "subscriptions", "users"
end
