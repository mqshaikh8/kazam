class CreatePosts < ActiveRecord::Migration[5.0]
    def change
      create_table :posts do |t|
        t.belongs_to :user
        t.belongs_to :group
        t.string :title
        t.string :content
        t.timestamps
      end
    end
  end