# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

i = 1
allresults = []

10.times do
url = "http://www.kickstarter.com/projects/search.json?page=#{i}&term=glasses"
resp = Net::HTTP.get_response(URI.parse(url))
buffer = resp.body
result = JSON.parse(buffer)
result["projects"].each do |project|
  allresults << project
end
i += 1
end

# allresults.each do |project|
# step 2
# profit.

allresults.each do |project|
  if Time.now < Time.at(project["deadline"])
  Project.where(:project_id => project["id"], :title => project["name"], :blurb => project["blurb"], :photo => project["photo"]["small"], :goal => project["goal"].to_i, :pledged => project["pledged"].to_i, :finish_date => project["deadline"], :backers_count => project["backers_count"].to_i, :url => project["urls"]["web"]["project"]).first_or_create
  end

end

