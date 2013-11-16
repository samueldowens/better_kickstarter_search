class Search < ActiveRecord::Base

  @@results = []

  # take a given term. get all of that term. every term will be glasses for now.
  

  def assign_point_values(term)
     Project.all.each do |project|
        project.points = 0
        project.title.downcase!
        project.blurb.downcase!
        case 
        when project.title.include?(term)
          project.points +=30
        when project.blurb.include?(term)
          project.points += 15
        when project.pledged / project.goal >= 0.75
          project.points += 5
        end
        @@results << project
      end
  end

  def top_ten(term)
    x = assign_point_values(term)
    x.sort_by! {|p| p.points}
    x.reverse!
  end

end

