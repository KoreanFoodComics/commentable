class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :comments_count
      t.timestamps
    end
  end
end
