class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |attribute|
      attribute.string :title
      attribute.string :content
      attribute.belongs_to :topic
      attribute.timestamps
    end
  end
end