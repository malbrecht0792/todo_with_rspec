class TasksController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @tasks = current_user.tasks
    end

    def show
    end

    def new
        @task = current_user.tasks.build()
    end

    def edit
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to Task.last
        else
            render 'new'
        end
    end

    def update
        if @task.update_attributes(task_params)
            redirect_to @task
        else
            render 'edit'
        end
    end

    def destroy
        @task.delete
        redirect_to tasks_path
    end

    private

    def task_params
        params.require(:task).permit(:name, :priority, :user_id)
    end

    def set_user
        @task = Task.find(params[:id])
    end
end
