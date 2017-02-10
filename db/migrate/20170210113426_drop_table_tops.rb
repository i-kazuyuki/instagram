class DropTableTops < ActiveRecord::Migration
  def change
    drop_table :tops
  end
end
