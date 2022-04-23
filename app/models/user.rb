class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  validates :username, presence: true
  has_many :products, dependent: :destroy
  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :product
  def already_favorited?(product)
    self.favorites.exists?(product_id: product.id)
  end
end
