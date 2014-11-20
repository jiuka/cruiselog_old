json.array!(@cruises) do |cruise|
  json.extract! cruise, :id, :title, :ship_id
  json.url cruise_url(cruise, format: :json)
end
