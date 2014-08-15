class ModifyEventTable < ActiveRecord::Migration
  def change
    remove_column :events, :start_date
    remove_column :events, :end_date
    remove_column :events, :start_time
    remove_column :events, :end_time

    add_column :events, :start, :time
    add_column :events, :end, :time
  end
end
