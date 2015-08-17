class Bundle < ActiveRecord::Base
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :products,
                                reject_if: proc { |attributes| attributes['title'].blank? }
end
