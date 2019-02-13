require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all()
  erb(:"bookings/index")
end

get '/bookings/new' do
  @members = Member.all()
  @activities = Activity.all()
  erb(:"bookings/new")
end

post '/bookings' do
  @activity = Activity.find(params["activity_id"])
  @activity.decrease_capacity()
  @activity.update()
  @booking = Booking.new(params)
  @booking.save
  redirect to("/activities")
end
