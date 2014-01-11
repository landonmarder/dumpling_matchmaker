class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :soup

      t.timestamps
    end
  end
end
