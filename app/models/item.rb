class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :category, optional: true
  belongs_to :shipping_method, optional: true
  has_many :likes
  has_many :comments
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :detail, presence: true
  validates :condition, presence: true
  validates :shipping_source, presence: true
  validates :delivery_date, presence: true
  validates :shipping_cost, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :shipping_method_id, presence: true
  validates :images, presence: true

  def previous
    user.items.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end
    #商品詳細ページで、前後のアイテムへのページ遷移
  def next
    user.items.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

end
