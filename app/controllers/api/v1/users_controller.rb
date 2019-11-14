class Api::V1::UsersController < ApplicationController
  def index
    user = User.all
    render json: user, only: %i[id username]
  end

  def tasks
    task_view = User.all_tasks_by_date
    render json: task_view
  end
end
