class Addjsontoquery < ActiveRecord::Migration
  def change
    add_column :queries, :response, :text
  end
end
