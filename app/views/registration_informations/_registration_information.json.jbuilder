json.extract! registration_information, :id, :student_id, :semester_id, :course_id, :mark, :grade, :created_at, :updated_at
json.url registration_information_url(registration_information, format: :json)
