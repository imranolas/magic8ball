require 'sinatra'
require 'sinatra/json'

get '/' do
	erb :index, :locals => { :ask => "", :answer => "", :name => "" }
end

post '/' do
	ask = params[:ask] 
	json :ask => question(ask), :answer => answer(ask)[1], :name => answer(ask)[0] 
end

def answer(ask)
	answers = {
		"It is certain" => :yes,
		"It is decidedly so" => :yes,
		"Without a doubt" => :yes,
		"Yes definitely" => :yes,
		"You may rely on it" => :yes,
		"As I see it, yes" => :yes,
		"Most likely" => :yes,
		"Outlook good" => :yes,
		"Yes" => :yes,
		"Signs point to yes" => :yes,
		"Reply hazy try again" => :unsure,
		"Ask again later" => :unsure,
		"Better not tell you now" => :unsure,
		"Cannot predict now" => :unsure,
		"Concentrate and ask again" => :unsure,
		"Don't count on it" => :no,
		"My reply is no" => :no,
		"My sources say no" => :no,
		"Outlook not so good" => :no,
		"Very doubtful" => :no
	}

	text = answers.keys[rand(answers.length)]

	is_a_question?(ask) ? [answers[text], text] : [:no, "You forgot to ask a question, numnuts!"]

end

def question(asked)
	!asked.empty? ? asked : "???"
end

def is_a_question?(question)
	/.+[?]/.match(question).nil? ? false : true
end