class CreateFriendshipRelation < ActiveRecord::Migration[5.2]
  def up
    create_table :friendship_relations do |t|
    	t.string :follower_id
    	t.string :followed_id

    	t.timestamps
    end
  end

  def down
  	drop_table "friendship_relations"
  end
end
