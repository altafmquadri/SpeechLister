class List < ApplicationRecord
    has_many :tasks, dependent: :destroy 
    has_many :users, through: :tasks
    CATEGORIES = %w[grocery todo personal] 
    validates :category, inclusion: {in: CATEGORIES}
end
