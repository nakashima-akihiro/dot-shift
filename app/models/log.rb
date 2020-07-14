class Log < ApplicationRecord
  belongs_to :user

  validate :date_no_use_after_today

  private

  def date_no_use_after_today
    errors.add(:day, "は今日より前の日選択してください") if day.nil? || day > Time.current
  end
end
