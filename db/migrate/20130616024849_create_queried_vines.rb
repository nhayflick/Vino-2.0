class CreateQueriedVines < ActiveRecord::Migration
  def change
    create_table :queried_vines do |t|
      t.integer :query_id
      t.integer :vine_id

      t.timestamps
    end
  end
end
