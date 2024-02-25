json.extract! student, :id, :name, :name_hurigana, :grade, :personality, :attitude, :created_at, :updated_at
json.url student_url(student, format: :json)
