class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :day, null: false
      t.string :time_in
      t.string :time_out
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
