class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :link

      t.timestamps
    end
    add_index :votes, :link_id
  end
end
