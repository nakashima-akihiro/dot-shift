class AddRestTimeToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :rest_time, :string
  end
end
