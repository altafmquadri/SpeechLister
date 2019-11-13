class List < ApplicationRecord
    has_many :tasks, dependent: :destroy 
    has_many :users, through: :tasks
    CATEGORIES = %w[grocery todo personal] 
    validates :category, inclusion: {in: CATEGORIES}
    validates :title, presence: true

    def tasks_by_completed
        tasks.sort_by {|task| task.completed ? 0 : 1}.reverse
    end

end
