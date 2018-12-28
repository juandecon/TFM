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

ActiveRecord::Schema.define(version: 2018_12_28_215505) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "apellidos"
    t.integer "perfil_id"
    t.integer "category_id"
    t.integer "empresa_id"
    t.index ["category_id"], name: "index_admin_users_on_category_id"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["empresa_id"], name: "index_admin_users_on_empresa_id"
    t.index ["perfil_id"], name: "index_admin_users_on_perfil_id"
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.integer "course_id"
    t.string "moodle_cmid"
    t.datetime "duedate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_assignments_on_course_id"
  end

  create_table "assignments_competencies", force: :cascade do |t|
  end

  create_table "categories", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competencies", force: :cascade do |t|
    t.string "nombre"
    t.integer "competency_framework_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "moodle_id"
    t.string "moodle_competencyframeworkid"
    t.string "moodle_idnumber"
    t.index ["competency_framework_id"], name: "index_competencies_on_competency_framework_id"
  end

  create_table "competencies_courses", force: :cascade do |t|
  end

  create_table "competency_frameworks", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "moodle_id"
    t.string "moodle_contextid"
    t.string "moodle_idnumber"
    t.string "moodle_contextname"
  end

  create_table "courses", force: :cascade do |t|
    t.string "nombre"
    t.datetime "startdate"
    t.datetime "enddate"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "moodle_id"
    t.string "moodle_shortname"
    t.string "moodle_fullname"
    t.index ["category_id"], name: "index_courses_on_category_id"
  end

  create_table "courses_students", force: :cascade do |t|
  end

  create_table "empresas", force: :cascade do |t|
    t.string "razonsocial"
    t.string "cif"
    t.string "domicilio"
    t.string "localidad"
    t.string "codigopostal"
    t.string "email"
    t.string "nombrerepresentante"
    t.datetime "fechaoferta"
    t.boolean "convenio"
    t.string "actividad"
    t.string "tutorempresa"
    t.string "emailtutorempresa"
    t.integer "numeroalumnos"
    t.integer "alumnosasignados"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "telefono"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "student_id"
    t.integer "assignment_id"
    t.string "score"
    t.string "moodle_userid"
    t.string "moodle_assignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_grades_on_assignment_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
  end

  create_table "perfils", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "moodle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
