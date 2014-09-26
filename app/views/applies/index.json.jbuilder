json.array!(@applies) do |apply|
  json.extract! apply, :id, :cover
  json.url apply_url(apply, format: :json)
end
