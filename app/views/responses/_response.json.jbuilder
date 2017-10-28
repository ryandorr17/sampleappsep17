json.extract! response, :id, :guess, :correct, :round_number, :picture, :created_at, :updated_at
json.url response_url(response, format: :json)
