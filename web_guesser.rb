require 'sinatra'
require 'sinatra/reloader'

number = rand(101)

get '/' do
  result = check_guess(number)
  final = final(number)
  color = change_color(number)
  erb :index, :locals => {:number => number, :result => result, :final => final,
                          :color => color}
end

def check_guess(number)
  if params['guess'].to_i > number + 5
    "Way too high!"
  elsif
    params['guess'].to_i < number - 5
    "Way too low!"
  elsif params['guess'].to_i > number
    "Too high!"
  elsif params['guess'].to_i < number
    "Too low!"
  else
    return "You got it right!"
  end
end

def final(number)
  if check_guess(number) == "You got it right!"
    "The SECRET NUMBER is #{number}"
  end
end

def change_color(number)
  if params['guess'].to_i > number + 5
    'red'
  elsif params['guess'].to_i < number - 5
    'red'
  elsif params['guess'].to_i > number
    'IndianRed'
  elsif params['guess'].to_i < number
    'IndianRed'
  else
    'green'
  end
end
