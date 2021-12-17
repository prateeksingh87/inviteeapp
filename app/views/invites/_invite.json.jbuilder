json.extract! invite, :id, :address, :referal_code, :created_at, :updated_at
json.url invite_url(invite, format: :json)
