class CreateOutboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :outboxes do |t|

      t.timestamps
    end
  end
end
