class CreateLinkedTweets < ActiveRecord::Migration
  def change
    create_table :linked_tweets do |t|
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps null: false
    end
  end
end
