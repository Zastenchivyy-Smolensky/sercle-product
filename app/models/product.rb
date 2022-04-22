class Product < ApplicationRecord
    attachment :image
    belongs_to :user
    
    with_options presence: true do
        validates :title
        validates :content
        validates :tech
        validates :span
        validates :image
    end


end
