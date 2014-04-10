class Order < ActiveRecord::Base
  has_and_belongs_to_many :users, dependent: :destroy
  has_and_belongs_to_many :products, dependent: :destroy
end
