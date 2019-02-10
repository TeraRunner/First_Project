require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all()
  erb(:"bookings/index")
end
booking
get '/bookings/:id' do
  @booking = Booking.find(params['id'].to_i)
  erb(:"bookings/show")
end

get '/bookings/new' do
  @bookings = Booking.all
  erb(:"bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to("/bookings")
end

post '/bookings/:id/delete' do
  Booking.destroy(params[:id])
  redirect to("/bookings")
end
