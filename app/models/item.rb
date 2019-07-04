class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :category, optional: true
  has_many :likes
  has_many :comments
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_many :transactions, dependent: :destroy

  def previous
    user.items.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.items.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

  # def reject_image(attributes)
  #   if attributes[:id]
  #     attributes.merge!(_destroy: "1") if attributes[:image_cache].blank? && attributes[:image].blank?
  #     false
  #   else
  #     false
  #   end
  # end

end
