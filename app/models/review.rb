class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user


    validates :description, presence: true
    validates :rating, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}
    # validates :user, presence: true
    validates :product, presence: true

end
