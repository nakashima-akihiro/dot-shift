class User::LogsController < ApplicationController
  def index
    @logs = current_user.logs
  end

  def time_in
    @user = current_user
    @log = current_user.logs.build(log_params)
    unless Log.find_by(day: @log.day)
      @log.save
      redirect_to root_path, notice: '出勤しました'
    else
      flash.now[:alert] = 'すでに出勤しています'
      render template: "user/users/top"
    end
  end

  def time_out
    @user = current_user
    @log = @user.logs.find_by(day: params[:log][:day])
    if @log.time_out == nil
      binding.pry
      @log.time_out = Time.now.to_s.split(' ')[1]
      @log.save
      redirect_to root_path, notice: '退勤しました'
    else
      flash.now[:alert] = 'すでに退勤しています'
      render template: "user/users/top"
    end
  end

  private

  def log_params
    params.require(:log).permit(:day, :time_in, :time_out)
  end
end
