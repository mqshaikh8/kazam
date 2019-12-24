class CreateConnections < ActiveRecord::Migration[5.0]
    def change
      create_table :connections do |t|
        t.belongs_to :user
        t.belongs_to :group
        t.timestamps
      end
    end
  end