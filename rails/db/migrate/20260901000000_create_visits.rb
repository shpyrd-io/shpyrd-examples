class CreateVisits < ActiveRecord::Migration[8.1]
  def change
    create_table :visits do |t|
      t.string :visitor, null: false
      t.timestamps
    end
  end
end
