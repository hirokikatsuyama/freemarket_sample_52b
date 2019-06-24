class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :category, optional: true
  has_many :likes
  has_many :comments
  has_many :images
  has_many :transactions

  def previous
    user.items.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.items.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
  #active_starage
  # has_many_attached :images
  #carria wave
  # mount_uploader :image, ImageUploader
  mount_uploaders :images, ImageUploader
end

