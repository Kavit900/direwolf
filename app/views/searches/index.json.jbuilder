json.array!(@searches) do |search|
  json.extract! search, :id, :search, :text_field_tag
  json.url search_url(search, format: :json)
end
