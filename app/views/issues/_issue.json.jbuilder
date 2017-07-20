json.extract! issue, :id, :title, :content, :courseid, :user, :username, :useremail, :created_at, :updated_at
json.url issue_url(issue, format: :json)
