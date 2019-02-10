require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/activity.rb' )
also_reload( '../models/*' )

get '/activities' do
  @activities = Activity.all()
  erb (:"activities/index")
end

get '/activities/:id' do
  @activity = Activity.find(params['id'].to_i)
  erb(:"activities/show")
end

get '/activities/new' do
  @activities = Activity.all
  erb(:"activities/new")
end

post '/activities' do
  activity = Activity.new(params)
  activity.save
  redirect to("/activities")
end

post '/activities/:id/delete' do
  Activity.destroy(params[:id])
  redirect to("/activities")
end
