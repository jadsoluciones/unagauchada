# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161116173242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "contenido"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
  end

  create_table "compras", force: :cascade do |t|
    t.integer  "monto"
    t.integer  "puntos_comprados"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "gauchadas", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "image_url"
    t.string   "ciudad"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "usuario_id"
    t.integer  "cloudinary_id"
  end

  create_table "logros", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postulacions", force: :cascade do |t|
    t.text     "descripcion"
    t.datetime "fecha"
    t.string   "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "contenido"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gauchada_id"
    t.integer  "usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "nombre"
    t.string   "apellido"
    t.string   "domicilio"
    t.datetime "fecNac"
    t.integer  "DNI"
    t.integer  "puntos",                 default: 1
    t.string   "rol",                    default: "UsReg"
    t.integer  "cloudinary_id"
    t.string   "image_url"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
