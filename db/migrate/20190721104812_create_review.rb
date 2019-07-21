class CreateReview < ActiveRecord::Migration[5.2]
  def up
    create_table :reviews do |t|
    	t.bigint :reviewer_id , index: true
    	t.bigint :reviewee_id , index: true
    	t.text :comment
    	t.float :rate

    	t.timestamps 
    end
  end

  def down
  	drop_table :reviews
  end

end
