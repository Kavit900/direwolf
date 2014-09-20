json.array!(@applications) do |application|
  json.extract! application, :id, :coverletter
  json.url application_url(application, format: :json)
end
