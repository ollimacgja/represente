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

ActiveRecord::Schema.define(version: 20131122220116) do

  create_table "clientes", force: true do |t|
    t.string   "cnpj"
    t.string   "inscricao_estadual"
    t.string   "inscricao_municipal"
    t.string   "nome_fantasia"
    t.string   "razao_social"
    t.string   "endereco"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.integer  "uf_id"
    t.integer  "cep"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "municipio"
    t.integer  "user_id"
  end

  create_table "fornecedors", force: true do |t|
    t.string   "cnpj"
    t.string   "inscricao_estadual"
    t.string   "inscricao_municipal"
    t.string   "nome_fantasia"
    t.string   "razao_social"
    t.string   "endereco"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.integer  "uf_id"
    t.integer  "cep"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "municipio"
    t.integer  "user_id"
  end

  create_table "orcamentos", force: true do |t|
    t.integer  "user_id"
    t.integer  "fornecedor_id"
    t.integer  "cliente_id"
    t.integer  "numero_orcamento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_orcamento"
  end

  create_table "produtos", force: true do |t|
    t.string   "referencia"
    t.string   "descricao"
    t.string   "unidade"
    t.integer  "quantidade"
    t.decimal  "preco_por_unidade"
    t.integer  "orcamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telefones", force: true do |t|
    t.string   "tipo"
    t.integer  "ddd"
    t.integer  "telefone"
    t.integer  "telefonavel_id"
    t.string   "telefonavel_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ufs", force: true do |t|
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
