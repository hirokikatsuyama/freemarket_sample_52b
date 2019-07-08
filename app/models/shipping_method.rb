class ShippingMethod < ActiveHash::Base
  self.data = [
      {name: '--'},
      {name: '送料込み(出品者負担)', value: '1'},
      {name: '着払い(購入者負担)', value: '2'}
  ]
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_method
end
