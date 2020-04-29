class User::LogsController < ApplicationController
  def index
    today = Time.current
    @logs = current_user.logs.where(day: today.all_month)
  end

  def last_month_index
    one_month_ago = Time.current.last_month
    @last_month_logs = current_user.logs.where(day: one_month_ago.all_month)
    # @sum_working_times = sum_working_times
  end

  def time_in
    @user = current_user
    @log = current_user.logs.build(log_params)
    unless @user.logs.find_by(day: Time.current.all_day)
      @log.save
      redirect_to root_path, notice: 'Good morning :)'
    else
      redirect_to root_path, alert: 'Your are already entried :('
    end
  end

  def time_out
    @user = current_user
    @log = @user.logs.find_by(day: Time.current.all_day)
    unless @log.time_out
      @log.time_out = Time.current
      @log.save
      redirect_to root_path, notice: 'See you again :)'
    else
      redirect_to root_path, alert: 'Your are already exited :('
    end
  end

  def edit
    @link_type = params[:link_type]
    @log = current_user.logs.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    if @log.update(log_params)
      redirect_to user_logs_path, notice: '変更しました'
    else
      render :edit
    end
  end

  private

  def log_params
    params.require(:log).permit(:day, :time_in, :time_out, :rest_time)
  end

  # def sum_working_times

  # end
end
