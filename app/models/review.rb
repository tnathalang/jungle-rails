class Review < ActiveRecord::Base
    belongs_to :product

    validates :product.name, presence: true
    validates :current_user, presence: true
    validates :description, presence: true
    validates :rating, presence: true


end
