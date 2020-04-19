class User::LogsController < ApplicationController
  def index
    @logs = current_user.logs
  end

  def time_in
    @user = current_user
    @log = current_user.logs.build(log_params)
    if Log.find_by(day: Time.current.all_day)
      flash.now[:alert] = 'すでに出勤してますねん(^ ^)'
      render template: "user/users/top"
    else
      @log.save
      flash.now[:alert] = 'おはよう!!!(^ ^)'
      render template: "user/users/top"
    end
  end

  def time_out
    @user = current_user
    @log = @user.logs.find_by(day: Time.current.all_day)
    if @log.time_out
      flash.now[:alert] = 'すでに退勤してますねん(^ ^)'
      render template: "user/users/top"
    else
      @log.time_out = Time.current
      @log.save
      flash.now[:alert] = 'お疲れ様でしたーーー!!!(^ ^)'
      render template: "user/users/top"
    end
  end

  def edit
    @log = Log.find(params[:id])
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
end
