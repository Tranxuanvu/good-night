class CreateUserRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :user_relationships do |t|
      t.references :follower, index: true, foreign_key: { to_table: :users }
      t.references :followee, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
