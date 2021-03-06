# Users
10.times.each do
  User.create(name: FFaker::Name.name)
end
