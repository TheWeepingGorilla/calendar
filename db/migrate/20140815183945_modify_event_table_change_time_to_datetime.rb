class ModifyEventTableChangeTimeToDatetime < ActiveRecord::Migration
  def change
    remove_column :events, :start, :time
    remove_column :events, :end, :time

    add_column :events, :start, :datetime
    add_column :events, :end, :datetime
  end
end
