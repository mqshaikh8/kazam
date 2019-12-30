class CreateUsers < ActiveRecord::Migration[5.0]
    def change
      create_table :users do |t|
        t.string :username
        t.string :name
        t.integer :age
        t.string :password
        t.string :location
        t.timestamps
      end
    end
  end