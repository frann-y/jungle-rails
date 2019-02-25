class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    #validates it  description and rating exists
    validates :product, presence: true
    validates :user, presence: true
    validates :description, presence: true
    validates :rating, presence: true

end
