class AddIndexOnFriendships < ActiveRecord::Migration[5.2]
  def up
  	add_index :friendship_relations , :follower_id
  	add_index :friendship_relations , :followed_id
  end
  def down
  	remove_index :friendship_relations, "index_friendship_relations_on_followed_id"
  	remove_index :friendship_relations , "index_friendship_relations_on_follower_id"
  end

end
