class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |g|
      g.string :title
      g.string :description
      g.timestamps
    end
  end

end