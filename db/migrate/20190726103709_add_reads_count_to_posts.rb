# frozen_string_literal: true

class AddReadsCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :reads_count, :integer, null: false, default: 0
  end
end
