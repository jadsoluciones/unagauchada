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

ActiveRecord::Schema.define(version: 20161029145927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "contenido"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "id_question"
  end

  create_table "gauchadas", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "imagen"
    t.string   "ciudad"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "id_postulacion"
    t.integer  "id_question"
  end

  create_table "logros", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "puntaje"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "logros", ["titulo", "puntaje"], name: "index_logros_on_titulo_and_puntaje", unique: true, using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "contenido"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "id_gauchada"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nombre"
    t.string   "apellido"
    t.string   "domicilio"
    t.datetime "fecNac"
    t.integer  "DNI"
    t.integer  "puntos",                 default: 1
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end