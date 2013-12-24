json.array!(@readings) do |reading|
  json.extract! reading, :book_id, :started_on, :finished_on, :comment
  json.url reading_url(reading, format: :json)
end
