json.array!(@ships) do |ship|
  json.extract! ship, :id, :title, :line_id, :port_of_origin_id
  json.url ship_url(ship, format: :json)
end
