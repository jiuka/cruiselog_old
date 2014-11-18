json.array!(@lines) do |line|
  json.extract! line, :id, :title
  json.url line_url(line, format: :json)
end
