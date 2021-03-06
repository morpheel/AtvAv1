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

ActiveRecord::Schema.define(version: 2018_10_18_001353) do

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

  create_table "avaliacaos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "data"
    t.bigint "disciplina_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descricao"
    t.index ["disciplina_id"], name: "index_avaliacaos_on_disciplina_id"
  end

  create_table "disciplinas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "cargaHoraria"
    t.bigint "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "turma_id"
    t.index ["professor_id"], name: "index_disciplinas_on_professor_id"
    t.index ["turma_id"], name: "index_disciplinas_on_turma_id"
  end

  create_table "frequenciaalunos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "data"
    t.bigint "disciplina_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disciplina_id"], name: "index_frequenciaalunos_on_disciplina_id"
  end

  create_table "funcionarios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "endereco"
    t.float "salario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "turno"
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

  create_table "presencas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "presenca"
    t.bigint "mat_disc_id"
    t.bigint "frequenciaaluno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frequenciaaluno_id"], name: "index_presencas_on_frequenciaaluno_id"
    t.index ["mat_disc_id"], name: "index_presencas_on_mat_disc_id"
  end

  create_table "professors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "avaliacao_id"
    t.bigint "mat_disc_id"
    t.float "nota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaliacao_id"], name: "index_provas_on_avaliacao_id"
    t.index ["mat_disc_id"], name: "index_provas_on_mat_disc_id"
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

  create_table "usuarios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.string "login"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["login"], name: "index_usuarios_on_login", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "avaliacaos", "disciplinas"
  add_foreign_key "disciplinas", "professors"
  add_foreign_key "disciplinas", "turmas"
  add_foreign_key "frequenciaalunos", "disciplinas"
  add_foreign_key "mat_discs", "disciplinas"
  add_foreign_key "mat_discs", "mat_turmas"
  add_foreign_key "mat_turmas", "alunos"
  add_foreign_key "mat_turmas", "turmas"
  add_foreign_key "presencas", "frequenciaalunos"
  add_foreign_key "presencas", "mat_discs"
  add_foreign_key "provas", "avaliacaos"
  add_foreign_key "provas", "mat_discs"
  add_foreign_key "turmas", "horas"
  add_foreign_key "turmas", "salas"
end
