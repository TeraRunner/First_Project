require_relative( "../models/member.rb" )
require_relative( "../models/activity.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Member.delete_all()
Activity.delete_all()

member1 = Member.new({
  "first_name" => "Paquito",
  "last_name" => "Chocolatero",
  "age" => "18",
  "address" => "C/ Ondebas",
  "email" => "cholatero@paco.es"
})
member1.save()

member2 = Member.new({
  "first_name" => "Mary",
  "last_name" => "Olsen",
  "age" => "25",
  "address" => "7/3 Church Street",
  "email" => "mary_olsen@hotmail.com"
})
member2.save()

activity1 = Activity.new({
  "activity" => "Yoga",
  "instructor" => "Bob",
  "day" => "Monday",
  "start_time" => "16:00",
  "capacity" => "0"
})
activity1.save()

activity2 = Activity.new({
  "activity" => "Cycling",
  "instructor" => "Brenda",
  "day" => "Tuesday",
  "start_time" => "18:00",
  "capacity" => "0"
})
activity2.save()

booking1 = Booking.new({
  "member_id" => member1.id,
  "activity_id" => activity1.id
})
booking1.save()

booking2 = Booking.new({
  "member_id" => member2.id,
  "activity_id" => activity2.id
})
booking2.save()

binding.pry
nil
