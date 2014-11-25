json.array!(@passengers) do |passenger|
  json.extract! passenger, :id, :firstname, :lastname
  json.url passenger_url(passenger, format: :json)
end
