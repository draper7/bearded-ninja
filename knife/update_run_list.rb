# ///// 
# // knife exec update_run_list.rb
# //
# // update node run_list 
# // useful for changing a role or recipe across your site 
# //


nl = []
rr = "role[stag]"
sr = "role[prod]"

#nodes.find(:role => 'stag') do |n|
nodes.find(:recipe => 'blah') do |n|
  puts "#{n.name}:"
  puts "old run_list: #{n.run_list}"
  n.run_list.each do |r|
    r = r.to_s
    # /// change role/recipe
    r.gsub!("#{rr}", "role[prod]")
    nl << "#{r}"

    # /// remove role/recipe
    # // if r != rr
    # // nl << "#{r}"
    # // end
  end
  puts nl
# //  n.run_list(nl)
# //  n.save
# //  puts "new run_list: #{n.run_list}"
# //  end
  # /// add role/recipe
  # //  nl <<  "role[new]" 
  # //  n.run_list(nl)
  # //  n.save
end
