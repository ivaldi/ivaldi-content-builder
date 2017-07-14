class CreateIvaldiContentBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.timestamps
    end

    create_table :content_blocks do |t|
      t.references :page, foreign_key: true
      t.references :blockable, polymorphic: true
      t.integer :sequence, default: 0, null: false
      t.timestamps
    end
  end
end