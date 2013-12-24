json.array!(@authors) do |author|
  json.extract! author, :book_id, :name
  json.url author_url(author, format: :json)
end
