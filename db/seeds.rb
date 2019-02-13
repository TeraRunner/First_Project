require_relative( "../models/member.rb" )
require_relative( "../models/activity.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Member.delete_all()
Activity.delete_all()
Booking.delete_all()

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

member3 = Member.new({
  "first_name" => "Antonio",
  "last_name" => "Franco Sanchez",
  "age" => "55",
  "address" => "C/ Gardenia 6",
  "email" => "antonio_el_del_polvero@hotmail.es"
})
member3.save()

member4 = Member.new({
  "first_name" => "Josefa",
  "last_name" => "Sanchez Gutierrez",
  "age" => "54",
  "address" => "C/ San Claudio 107",
  "email" => "la_pepa@hotmail.es"
})
member4.save()

activity1 = Activity.new({
  "activity" => "Yoga",
  "instructor" => "Bob",
  "day" => "Mondays",
  "start_time" => "16:00",
  "capacity" => "0"
})
activity1.save()

activity2 = Activity.new({
  "activity" => "Cycling",
  "instructor" => "Brenda",
  "day" => "Tuesdays",
  "start_time" => "18:00",
  "capacity" => "0"
})
activity2.save()

booking1 = Booking.new({
  "member_id" => member1.id,
  "activity_id" => activity1.id
})
booking1.save()
activity1.capacity += 1
activity1.update

booking2 = Booking.new({
  "member_id" => member2.id,
  "activity_id" => activity2.id
})
booking2.save()
activity2.capacity += 1
activity2.update

binding.pry
nil
