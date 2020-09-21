# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
  DISTINCT yr
  FROM
  nobels
  WHERE
  subject = 'Physics' AND NOT EXISTS (SELECT subject FROM nobels AS nobeles WHERE subject = 'Chemistry' AND nobels.yr = nobeles.yr)
  SQL
end
# AND NOT EXISTS (SELECT subject FROM nobels AS nobels_that_year WHERE subject = 'Chemistry')