json.array!(@publishers) do |publisher|
  json.extract! publisher, :book_id, :name
  json.url publisher_url(publisher, format: :json)
end
