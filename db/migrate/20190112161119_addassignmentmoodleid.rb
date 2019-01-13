class Addassignmentmoodleid < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :moodle_id, :string
  end
end
