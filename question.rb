class Question
attr_accessor :question

	def initialize(question)
		@question = question
		@@answers = {
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
	end


	def answer 

		text = @@answers.keys[rand(@@answers.length)]

		is_a_question? ? [@@answers[text], text] : [:no, "You forgot to ask a question, numnuts!"]
	end

	def answer_text
		answer[1]
	end

	def answer_class
		answer[0]
	end

	def question_empty
		!@question.empty? ? @question : "???"
	end

	def is_a_question?
		/.+[?]/.match(@question).nil? ? false : true
	end
end