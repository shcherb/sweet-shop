class Order < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :cart

  before_save :calculate_sum

  mount_uploader :image_url, ImageUploader

  validates :count, presence: true
  validates :image_url, allow_blank: true, format: {
      with:    %r{\.(gif|jpg|png)\Z}i,
      message: 'Must be a URL for GIF, JPG or PNG image.'
  }

  def self.add_product(product, cart)
    item = product.orders.where(cart_id: cart.id)
    if item.empty? || (product.by_weight > 0)
      current_item = self.new(cart_id: cart.id, count: 1, sum: product.price)
      current_item.products << product
    else
      current_item = self.find_by_id(item.first.id)
      current_item.count += 1
    end
    current_item
  end

private
  def calculate_sum
    if self.products.first.by_weight > 0
      self.sum = self.count * self.weight / self.products.first.by_weight * self.products.first.price
    else
      self.sum = self.count * self.products.first.price
    end
  end

end
