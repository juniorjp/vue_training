class CreateUserVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_votes do |t|
      t.references :user, index: true
      t.references :video, index: true
      t.timestamps
    end
  end
end
