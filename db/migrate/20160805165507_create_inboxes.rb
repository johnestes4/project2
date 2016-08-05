class CreateInboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :inboxes do |t|

      t.timestamps
    end
  end
end
