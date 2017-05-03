json.extract! course, :id, :course_id, :course_name, :credit, :created_at, :updated_at
json.url course_url(course, format: :json)
