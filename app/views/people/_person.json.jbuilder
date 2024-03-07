json.extract! person, :id, :name, :info, :title, :age, :phone, :email, :created_at, :updated_at
json.url person_url(person, format: :json)
