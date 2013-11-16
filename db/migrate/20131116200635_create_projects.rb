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

# title contains search param, 30pts
# blurb contains search param, 10 pts
# pledged/goal greater than .75 5 pts
# between .5 and .75 2 pts 
# backer count over 1000 4 pts
# backer count over 500  3 pts
# backer count over 250, 2 pts
# backer count over 100, 1 pt


