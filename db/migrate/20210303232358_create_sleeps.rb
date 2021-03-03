class CreateSleeps < ActiveRecord::Migration[6.0]
  def change
    create_table :sleeps do |t|
      t.datetime :go_to_bed_at
      t.datetime :wake_up_at
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
