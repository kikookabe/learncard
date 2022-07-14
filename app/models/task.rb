class Task < ApplicationRecord
    belongs_to :user

    validates :title, length: { maximum: 255 }
    validates :advise, length: { maximum: 255 }
    validates :comment, length: { maximum: 500 }

    
  
end
