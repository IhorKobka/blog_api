# frozen_string_literal: true

class AddFeaturedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :featured, :boolean, null: false, default: false
  end
end
