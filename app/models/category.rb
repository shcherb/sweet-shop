class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy

  mount_uploader :image_url, ImageUploader

  validates :image_url, allow_blank: true, format: {
      with:    %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }

end
