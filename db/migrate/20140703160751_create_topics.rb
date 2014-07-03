class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :category

      t.timestamps
    end
  end
end
