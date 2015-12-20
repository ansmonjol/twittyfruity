class RenameLinkedTweetsToRetweets < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up{
        rename_table :linked_tweets, :retweets
      }

      dir.down{
        rename_table :retweets, :linked_tweets
      }
    end
  end
end
