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

ActiveRecord::Schema.define(version: 20171105205739) do

  create_table "ators", force: :cascade do |t|
    t.string "nome"
    t.string "nome_artistico"
    t.integer "seguro_social"
    t.string "nacionalidade"
    t.string "idade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "personagem_id"
    t.integer "papel_id"
    t.index ["papel_id"], name: "index_ators_on_papel_id"
    t.index ["personagem_id"], name: "index_ators_on_personagem_id"
  end

  create_table "estudios", force: :cascade do |t|
    t.string "nome"
    t.string "nome_dono"
    t.date "data_fundacao"
    t.float "faturamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "filme_id"
    t.index ["filme_id"], name: "index_estudios_on_filme_id"
  end

  create_table "filmes", force: :cascade do |t|
    t.string "nome"
    t.integer "meses_producao"
    t.string "copyright"
    t.string "diretor"
    t.float "custo_total"
    t.integer "ano_lancamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "personagem_id"
    t.index ["personagem_id"], name: "index_filmes_on_personagem_id"
  end

  create_table "papels", force: :cascade do |t|
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personagems", force: :cascade do |t|
    t.string "nome"
    t.string "nome_filme"
    t.string "nome_ator"
    t.float "cache_ator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
