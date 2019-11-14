class User < ApplicationRecord
    has_many :tasks
    has_many :lists, through: :tasks

    # Class Methods

    def self.all_tasks_by_date
        User.all.map(&:tasks_by_date)
    end

    # Instance Methods

    def tasks_by_date
        uniq_dates = self.tasks.map(&:due_date).uniq

        {
            "#{self.username}" => uniq_dates.map do |date|
                {
                    "#{date}" => tasks.select do |task|
                        task.due_date == date
                    end.sort_by do |task|
                        task.completed ? 0 : 1
                    end.reverse
                }
            end
        }
    end
end
