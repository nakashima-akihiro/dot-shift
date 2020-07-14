class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.date :day, null: false
      t.datetime :time_in
      t.datetime :time_out
      t.float    :working_times
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
