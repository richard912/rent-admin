json.array!(@listings) do |listing|
  json.extract! listing, :id, :type
  json.url listing_url(listing, format: :json)
end
