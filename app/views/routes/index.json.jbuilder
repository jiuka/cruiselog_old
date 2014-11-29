json.array!(@routes) do |route|
  json.extract! route, :id, :from_id, :to_id, :line, :title
  json.url route_url(route, format: :json)
end
