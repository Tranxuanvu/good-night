# User
10.times.each do
  User.create(name: FFaker::Name.name)
end

# Past Week Sleep
today = Time.zone.today
start_date = today - today.wday - 6
end_date = today - today.wday
(start_date..end_date).to_a.each do |date|
  User.all.each_with_index do |user, index|
    go_to_bed_at = date.to_datetime - index.hour
    length_of_time_sleep = [6, 7, 8, 9].sample.hours
    user.sleeps_time.create(go_to_bed_at: go_to_bed_at, wake_up_at: go_to_bed_at + length_of_time_sleep)
  end
end
