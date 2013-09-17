class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |attribute|
      attribute.string :content
      attribute.string :title
      attribute.timestamps
    end
  end
end
