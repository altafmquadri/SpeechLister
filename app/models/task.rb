class Task < ApplicationRecord
  belongs_to :user
  belongs_to :list

  def self.sorted_tasks
    Task.all.sort_by(&:due_date)
  end

end
