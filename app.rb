require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/square/:number' do
    @number = params[:number]
    square = @number.to_i * @number.to_i
    "#{square}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number]
    @phrase = params[:phrase].gsub("%20", " ")
    counter =0
    result = ""
    while counter < @number.to_i
      counter += 1
      result += "#{@phrase}\n"
    end
    result
  end

  get '/say/*' do
    params[:splat].first.gsub("/", " ") + "."
  end

  get '/:operation/:number1/:number2' do
    if params[:operation] == 'add'
      "#{:number1+:number2}"
    elsif params[:operation] == 'subtract'
      "#{:number1-:number2}"
    elsif params[:operation] == 'multiply'
      "#{:number1*:number2}"
    elsif params[:operation] == 'divide'
      "#{:number1/:number2}"
    end
  end

end
