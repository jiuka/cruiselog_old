json.array!(@bridge_lines) do |bridge_line|
  json.extract! bridge_line, :id, :title
  json.url bridge_line_url(bridge_line, format: :json)
end
