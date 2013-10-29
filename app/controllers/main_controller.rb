class MainController < ApplicationController
	def index
	end
	def calculate
		#binding.pry
		if equation_validate(params[:q])
			p_eqn = to_postfix(params[:q]) 
		else
			redirect_to main_index_path,:notice=>"invalid character"
		end
	end

	private
	def equation_validate(eqn)
		eqn.match(/[^\d\/\-\/*()+%]./) ? false :true
	end
	def to_postfix(eqn)
		p_stack = Array.new
		p_string = ""
		binding.pry
	end
end
