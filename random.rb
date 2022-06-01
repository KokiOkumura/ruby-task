def divide_group
  members = %w[A B C D E F]
  first_group = members.sample(rand(2..3)).sort
  p first_group
  p members - first_group
end

divide_group
