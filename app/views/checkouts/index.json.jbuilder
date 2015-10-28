json.array!(@checkouts) do |checkout|
  json.extract! checkout, :id, :order_id_id, :user_id_id, :paid
  json.url checkout_url(checkout, format: :json)
end
