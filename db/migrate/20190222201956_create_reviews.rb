class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user_id
      t.text :description
      t.references :product_id
      t.integer :rating

      t.timestamps null: false
    end
  end
end
