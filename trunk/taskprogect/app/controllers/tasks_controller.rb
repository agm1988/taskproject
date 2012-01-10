class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to task_path(@task)
      flash[:notice] = "Task created"
    else
      render("new")
      flash[:notice] = "Task not created"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to task_path(@task)
    else
      render("edit")
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Task destroyed."
    redirect_to tasks_path
  end

  def archive
    @tasks = Task.where(:complete => params[:comp])
  end

  def markcomplete
    @task = Task.find(params[:id])
    @task.update_attribute(:complete, true)
    flash[:notice] = "Task complete updated"
    redirect_to completed_tasks_path
  end

  def completed
    @tasks = Task.where(:complete => true)
  end
  
end
