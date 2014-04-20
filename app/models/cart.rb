class Cart < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_one :users

end
