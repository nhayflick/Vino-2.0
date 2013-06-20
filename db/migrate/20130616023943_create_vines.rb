class CreateVines < ActiveRecord::Migration
  def change
    create_table :vines do |t|
      t.string :url
      t.string :fallback_url
      t.string :from_user
      t.string :from_user_id
      t.string :profile_image_url
      t.datetime :tweeted_at
      t.string :text

      t.timestamps
    end
  end
end