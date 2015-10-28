class Checkout < ActiveRecord::Base
  belongs_to :order_id
  belongs_to :user_id
end
