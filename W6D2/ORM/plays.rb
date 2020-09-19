require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
    SELECT
    *
    FROM
    plays
    WHERE
    plays.title = ?
    SQL
    Play.new(play[0])
  end

  def self.find_by_playwright(name)
    playwright_array = PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT
    id
    FROM
    playwrights
    WHERE
    name = ?
    SQL
    playwright_id = playwright_array[0]["id"]
    plays = PlayDBConnection.instance.execute(<<-SQL, playwright_id)
    SELECT
    *
    FROM
    plays
    WHERE
    playwright_id = ?
    SQL
    plays
  end

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

p Play.find_by_playwright('Arthur Miller')