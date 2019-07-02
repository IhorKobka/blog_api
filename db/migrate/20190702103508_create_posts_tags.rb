# frozen_string_literal: true

class CreatePostsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_tags do |t|
      t.references :post, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
      t.timestamps
    end

    add_index :posts_tags, %i[post_id tag_id], unique: true
  end
end
