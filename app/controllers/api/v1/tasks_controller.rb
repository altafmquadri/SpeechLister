class Api::V1::TasksController < ApplicationController
    def index
        sorted_tasks = Task.sorted_tasks
        render json: sorted_tasks, only: %i[id content due_date completed],
        include: {
            user: {
                only: %i[id username]
            }
        }
    end
    
    def create
       task = Task.create(task_params) 
       render json: task, include: {
           user: {
               only: %i[id username]
           }
       }
    end

    def update
        task = Task.find(params[:id])
        task.update(task_params)
        render json: task
    end

    def complete
        task = Task.find(params[:id])
        task.completed = !task.completed
        task.save
        render json: task
    end

    def destroy
        task = Task.find(params[:id])
        render json: task.destroy
    end

    private

    def task_params
        params.require(:task).permit(:due_date, :content, :user_id, :list_id)
    end
end
