json.array!(@indications) do |indication|
  json.extract! indication, :id
  json.url indication_url(indication, format: :json)
end
