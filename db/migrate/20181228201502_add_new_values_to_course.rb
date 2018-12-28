class AddNewValuesToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :moodle_id, :string
    add_column :courses, :moodle_shortname, :string
    add_column :courses, :moodle_fullname, :string
  end
end
