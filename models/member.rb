require_relative( '../db/sql_runner' )

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :address, :email

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age']
    @address = options['address']
    @email = options['email']
  end

  def full_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  # def activities()
  #   sql = "SELECT activities.*
  #   FROM activities INNER JOIN bookings
  #   ON bookings.activity_id = activities.id
  #   WHERE bookings.members_id = $1;"
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map { |activity| Activity.new(activity) }
  # end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      age,
      address,
      email
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@first_name, @last_name, @age, @address, @email]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE members
    SET
    (
      first_name,
      last_name,
      age,
      address,
      email
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@first_name, @last_name, @age, @address, @email, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |member| Member.new( member ) }
  end

  def self.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
