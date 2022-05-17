members = ["A","B","C","D","E","F"]

# 3、3に分割
split_3_a_group = members.sample(3).sort
split_3_b_group = members - split_3_a_group.sort

# 2、4に分割
split_24_a_group =  members.sample(2).sort
split_24_b_group = members - split_24_a_group.sort


pattern = rand(2)


if pattern == 0
  p split_3_a_group
  p split_3_b_group
elsif pattern == 1
  p split_24_a_group
  p split_24_b_group
end

  

