class Task < ApplicationRecord
  belongs_to :user
  belongs_to :list

  def self.sorted_tasks
    Task.all.sort_by(&:due_date)
  end

  # def self.by_date
  #   uniq_due = Task.all.map{|task| task.due_date}.uniq
  #   uniq_due.map{|due_date| {due_date => Task.all.select{|task| task.due_date == due_date}}}
  # end

  # def self.by_date_user(username)
  #   user_tasks = Task.all.select{|task| task.user.username == username}
  #   uniq_dates = user_tasks.map(&:due_date).uniq
  #   tasks_per_date_per_user = uniq_dates.map{|task| username => []}
  # end

end

# user_tasks = User.all.map{|user| user.tasks}
# users_due_dates = user_tasks.map(&:due_date).uniq
# user_tasks.map{|task| task.user.username => users_due_dates.map{|due_date|{due_date => Task.all.select{|task| task.due_date == due_date}}}}

# [
#   {
#     due_date: [
#       task1, task2, task3
#     ]
#   }
# ]

# [
#   altaf: [
#     {2019-10-10: [
#       task1, task2, task3
#     ]},
#     {2018-12-41: [

#     ]}
#   ]
# ]