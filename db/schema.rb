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

ActiveRecord::Schema.define(version: 2018_11_04_001508) do

  create_table "comentarios", force: :cascade do |t|
    t.datetime "fecha"
    t.string "comentario"
    t.string "depactual"
    t.string "depanterior"
    t.integer "pqr_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pqr_id"], name: "index_comentarios_on_pqr_id"
  end

  create_table "dependencia", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pqrs", force: :cascade do |t|
    t.datetime "fecha"
    t.string "descripcion"
    t.string "archivo"
    t.boolean "estado"
    t.integer "usuario_id"
    t.integer "dependencium_id"
    t.string "respuesta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dependencium_id"], name: "index_pqrs_on_dependencium_id"
    t.index ["usuario_id"], name: "index_pqrs_on_usuario_id"
  end

  create_table "rols", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipodocumentos", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "celular"
    t.integer "rol_id"
    t.integer "dependencium_id"
    t.string "email"
    t.integer "tipodocumento_id"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dependencium_id"], name: "index_usuarios_on_dependencium_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["rol_id"], name: "index_usuarios_on_rol_id"
    t.index ["tipodocumento_id"], name: "index_usuarios_on_tipodocumento_id"
  end

end
