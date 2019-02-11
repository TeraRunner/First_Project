require_relative( '../db/sql_runner' )

class Activity

  attr_reader :id
  attr_accessor :activity, :instructor, :day, :start_time, :capacity

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @activity = options['activity']
    @instructor = options['instructor']
    @day = options['day']
    @start_time = options['start_time']
    @capacity = options['capacity']
  end

  def members()
    sql = "SELECT members.*
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    WHERE bookings.activity_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def save()
    sql = "INSERT INTO activities
    (
      activity,
      instructor,
      day,
      start_time,
      capacity
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@activity, @instructor, @day, @start_time, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE activities
    SET
    (
      activity,
      instructor,
      day,
      start_time,
      capacity
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@activity, @instructor, @day, @start_time, @capacity]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM activities"
    results = SqlRunner.run( sql )
    return results.map { |activity| Activity.new(activity) }
  end

  def self.find( id )
    sql = "SELECT * FROM activities
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Activity.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM activities"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM activities
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
