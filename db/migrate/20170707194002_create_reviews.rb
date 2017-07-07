class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :body
      t.string :user_id
      t.string :product_id
      t.timestamps
    end
  end
end
