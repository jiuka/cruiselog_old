json.array!(@cruise_segments) do |cruise_segment|
  json.extract! cruise_segment, :id, :cruise_id, :from_id, :to_id, :route, :=
  json.url cruise_segment_url(cruise_segment, format: :json)
end
