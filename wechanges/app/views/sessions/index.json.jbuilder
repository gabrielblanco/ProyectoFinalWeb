json.array!(@sessions) do |session|
  json.extract! session, :id, :token, :date, :id_user
  json.url session_url(session, format: :json)
end
