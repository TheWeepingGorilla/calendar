class CreateEventTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.string :location
      t.date   :start_date
      t.date   :end_date
      t.time   :start_time
      t.time   :end_time
    end
  end
end
