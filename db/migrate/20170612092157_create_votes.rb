class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.integer :user_id
      t.references :voteable, polymorphic: true
      # t.references achieves the same as this:
      # t.integer :voteable_id
      # t.string :voteable_type

      t.timestamps
    end
  end
end
