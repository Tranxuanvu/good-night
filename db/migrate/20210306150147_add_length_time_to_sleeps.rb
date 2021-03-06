class AddLengthTimeToSleeps < ActiveRecord::Migration[6.0]
  def change
    add_column :sleeps, :length_time, :decimal
  end
end
