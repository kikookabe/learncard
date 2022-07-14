class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy overwrite ]

  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.new(task_params)
    @task.start_date = Time.new

    respond_to do |format|
      if @task.save
        format.html { redirect_to endtime_task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(end_date: Time.new)
        format.html { redirect_to comment_task_url(id: @task.id), notice: "Task was successfully updated." }
        format.json { render :comment, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def endtime
    @task = current_user.tasks.find(params[:id])
  end

  def comment
    @task = current_user.tasks.find(params[:id])
  end

  def write
    @task = current_user.tasks.find(params[:id])
    respond_to do |format|
      if @task.update(comment: params[:task][:comment])
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def overwrite
    respond_to do |format|
      if @task.update(task_params)
        if current_user.admin == false
          format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { redirect_to admin_users_url, notice: "毎日見て応援しましょう" }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      if current_user.admin == false
        @task = current_user.tasks.find(params[:id])
      else
        @task = Task.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :start_date, :end_date, :comment, :advise)#.merge(user_id: current_user.id, totaltime: (@task.end_date - @task.start_date).floor / 3600)
    end
end
