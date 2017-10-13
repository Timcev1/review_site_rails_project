class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :review_id
      t.integer :user_id

      t.timestamps
    end
  end
end
