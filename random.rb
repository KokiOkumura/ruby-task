def split_group
  members = ["A","B","C","D","E","F"]
  split_group = members.sample(rand(2..3)).sort
  p split_group
  p members - split_group
end

split_group

