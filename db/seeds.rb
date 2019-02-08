require_relative( "../models/member.rb" )
require_relative( "../models/activity.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Member.delete_all()

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
  "address" => "7/3 Church street",
  "email" => "mary_olsen@hotmail.com"
})

member2.save()

binding.pry
nil
