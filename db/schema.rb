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

ActiveRecord::Schema.define(version: 2018_10_06_162449) do

  create_table "alunos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.date "dt_Nasc"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "disciplinas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "cargaHoraria"
    t.bigint "professor_id"
    t.bigint "turma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id"], name: "index_disciplinas_on_professor_id"
    t.index ["turma_id"], name: "turmas"
  end

  create_table "horas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.time "inicio"
    t.time "fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mat_discs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "mat_turma_id"
    t.bigint "disciplina_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disciplina_id"], name: "index_mat_discs_on_disciplina_id"
    t.index ["mat_turma_id"], name: "index_mat_discs_on_mat_turma_id"
  end

  create_table "mat_turmas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "aluno_id"
    t.bigint "turma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_mat_turmas_on_aluno_id"
    t.index ["turma_id"], name: "index_mat_turmas_on_turma_id"
  end

  create_table "professors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "numSala"
    t.string "bloco"
    t.string "capacidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.bigint "sala_id"
    t.bigint "hora_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hora_id"], name: "index_turmas_on_hora_id"
    t.index ["sala_id"], name: "index_turmas_on_sala_id"
  end

  add_foreign_key "disciplinas", "professors"
  add_foreign_key "mat_discs", "disciplinas"
  add_foreign_key "mat_discs", "mat_turmas"
  add_foreign_key "mat_turmas", "alunos"
  add_foreign_key "mat_turmas", "turmas"
  add_foreign_key "turmas", "horas"
  add_foreign_key "turmas", "salas"
end
