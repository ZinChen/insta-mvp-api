class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :image_url
      t.string :description
      t.references :user, foregin_key: true

      t.timestamps
    end
  end
end
