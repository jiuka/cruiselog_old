json.array!(@port_of_calls) do |port_of_call|
  json.extract! port_of_call, :id, :ship_id, :port_id, :arrive, :leave
  json.url port_of_call_url(port_of_call, format: :json)
end
