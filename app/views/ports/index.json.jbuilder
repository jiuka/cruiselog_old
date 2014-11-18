json.array!(@ports) do |port|
  json.extract! port, :id, :Port, :title, :country, :location
  json.url port_url(port, format: :json)
end
