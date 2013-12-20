class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.boolean :private
      t.boolean :completed
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
