class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :original_location
      t.string :destination_location
      t.float :distance

      t.timestamps
    end
  end
end
