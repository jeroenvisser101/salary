require 'sinatra'
require 'working_hours'

get '/' do
  WorkingHours::Config.time_zone = 'Amsterdam'

  WorkingHours::Config.holidays = [
    Date.new(Date.today.year, 12, 25),
    Date.new(Date.today.year, 12, 26),
    Date.new(Date.today.year, 01, 01)
  ]

  salary_day = 26
  curr_salary_date = Date.new(Date.today.year, Date.today.month, salary_day)

  unless curr_salary_date.working_day?
    curr_salary_date = curr_salary_date - 1.working.day
  end

  @full_date = curr_salary_date.strftime("%A, %d %B %Y")
  
  erb :index
end
