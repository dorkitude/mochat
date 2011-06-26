class CreateWhispers < ActiveRecord::Migration
  def self.up
    create_table :whispers do |t|
      t.string :contents
      t.references :sender, :class_name => "User"
      t.references :receiver, :class_name => "User"

      t.timestamps
    end
  end

  def self.down
    drop_table :whispers
  end
end
