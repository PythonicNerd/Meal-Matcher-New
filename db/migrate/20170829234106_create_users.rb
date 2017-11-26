class CreateUsers < ActiveRecord::Migration[5.0]
  attr_accessor :poster
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      
      t.integer :zip

      t.timestamps
    end
  end
end
