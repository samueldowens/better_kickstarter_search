class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.integer :project_id
      t.string :title
      t.string :blurb
      t.string :photo
      t.integer :goal
      t.integer :pledged
      t.integer :finish_date
      t.integer :backers_count
      t.string :url

      t.timestamps
    end
  end
end
