class CreateTitleBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :title_blocks do |t|
      t.string :title

      t.timestamps
    end
  end
end
