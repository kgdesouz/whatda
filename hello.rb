require 'sinatra'
require 'logger'

def check_age_sprint1(age)

    logger = Logger.new(STDOUT)
    logger.level = Logger.const_get((ENV["LOG_LEVEL"] || "INFO").upcase)

    logger.info "---check_age_sprint1: INPUT GIVEN-------------"
    logger.info age

    # to int
    if age.to_i == 0
      @insurance_age = 'No insurance'
    elsif age.to_i == 15
      @insurance_age = 'No insurance'
    elsif age.to_i == 16
      @insurance_age = '$800 / Month'
    elsif age.to_i == 29
      @insurance_age = '$600 / Month'
    end
    
    return @value
end


def check_age_sprint2(age)

    logger = Logger.new(STDOUT)
    logger.level = Logger.const_get((ENV["LOG_LEVEL"] || "INFO").upcase)

    logger.info "---check_age_sprint2: INPUT GIVEN-------------"
    logger.info age
    
    if age.to_i.between?(0, 15)
       @insurance_age = 'No insurance'

    elsif age.to_i.between?(16, 21)
      @insurance_age = 'Age 16-21:  $800/Month'
    elsif age.to_i.between?(21, 29)
      @insurance_age = 'Age 21-29:  $600/Month'
    elsif age.to_i.between?(29, 40)
      @insurance_age = 'Age 31-40:  $500/Month'
    elsif age.to_i.between?(41, 50)
      @insurance_age = 'Age 41-50:  $400/Month'
    elsif age.to_i.between?(51, 71)
      @insurance_age = 'Age 51-71:  $500/Month'
    elsif age.to_i.between?(71, 90)
      @insurance_age = 'Age 71-90:  $700/Month' 
    end

      
    return @value
end

enable :sessions

get '/story/1/sprint/1' do
  erb :sprint1
end

post '/story/1/sprint/1' do
  @var_age = check_age_sprint1(params[:insured_age])
  erb :sprint1
end

get '/story/1/sprint/2' do
  erb :sprint2
end

post '/story/1/sprint/2' do
  @var_age = check_age_sprint2(params[:insured_age])
  erb :sprint2
end


# sprint 3 - better UI, fixes to code base
# sprint 4 - 

not_found do
  status 404
  'Welcome to the test.'
end