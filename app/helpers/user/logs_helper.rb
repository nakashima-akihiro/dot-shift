module User::LogsHelper
  def working_times(log)
    attendance = log.time_in
    leaving = log.time_out

    # 滞在時間(分)（休憩も含む）
    working_seconds = leaving - attendance
    working_minutes = working_seconds / 60

    # 休憩時間
    binding.pry
    rest_time_array = log.rest_time.split(':').map(&:to_i)
    rest_time_minutes = rest_time_array[0] * 60 + rest_time_array[1]

    # 実質労働分
    real_working_minutes = working_minutes - rest_time_minutes


    real_working_minutes_array = real_working_minutes.divmod(60)
    real_working_minutes_array[0].to_s.rjust(2, '0') + ':' + real_working_minutes_array[1].to_i.to_s.rjust(2, '0')
  end
end
