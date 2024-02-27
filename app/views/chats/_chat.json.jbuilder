json.extract! chat, :id, :message, :is_from, :teacher_id, :created_at, :updated_at
json.url chat_url(chat, format: :json)
