class User < ApplicationRecord
    has_many :tasks
    has_many :lists, through: :tasks

    def self.tasks_by_date

        all_tasks = User.all.map(&:tasks).flatten
        all_uniq_dates = all_tasks.map(&:due_date).uniq
        
        all_tasks.map do |task|
            {"#{task.user.username}" => all_uniq_dates.map do |due_date|
                {"#{due_date}" => all_tasks.select do |task|
                    task.due_date == due_date
                end.sort_by{|task| task.completed ? 0 : 1}.reverse}
            end}
        end.uniq
    end
end
