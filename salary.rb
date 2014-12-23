require 'sinatra'
require 'working_hours'

get '/' do
  WorkingHours::Config.time_zone = 'Amsterdam'

  WorkingHours::Config.holidays = [
    Date.new(Date.today.year, 12, 25),
    Date.new(Date.today.year, 12, 26),
    Date.new(Date.today.year, 01, 01)
  ]

  @salary_date = Date.new(Date.today.year, Date.today.month, 26)

  @salary_date -= 1.working.day unless @salary_date.working_day?

  erb :index
end
