# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  SELECT
  name
  FROM
  countries
  WHERE
  gdp > ALL (SELECT gdp FROM countries WHERE continent = 'Europe' AND gdp IS NOT NULL) AND gdp IS NOT NULL
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
  SELECT
  continent, name, area
  FROM
  countries
  WHERE
  area = (SELECT MAX(area) FROM countries AS countries2 WHERE countries2.continent = countries.continent)
  GROUP BY
  continent, name, area


  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
  SELECT
  c.name, c.continent
  FROM
  countries AS c
  WHERE
  c.population >= ALL (SELECT c2.population * 3 FROM countries AS c2 WHERE c2.continent = c.continent AND c2.name != c.name)
  SQL
end
