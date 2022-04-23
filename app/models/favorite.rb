class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :product
    validates_uniqueness_of :product_id, score: :user_id
end
