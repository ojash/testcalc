#require "#{Rails.root}/lib/validation_and_calculation.rb"
class MainController < ApplicationController
	include Calculation
	def index
		#a,b,c = 400,400,400;
		#if (a and b and c) < 80
		#	@res = "less"
		#elsif (a or b or c) > 400
		#	@res = "more"
		#else
		#	@res = "good"
		#end
	end
	def calculate
		#binding.pry
		#if equation_validate(params[:q])
		#binding.pry
		@val = ValidationAndCalculation.new
		if @val.equation_validate(params[:q])
			#p_eqn = to_postfix(params[:q])
			p_eqn = @val.to_postfix(params[:q])
			result = evaluate_postfix(p_eqn)
			redirect_to main_index_path,:notice=> p_eqn.join + " = " + result.to_s
		else
			redirect_to main_index_path,:notice=>"invalid character"
		end
	end

	private
	def evaluate_postfix(eqn)
		@p_values = Array.new
		eqn.each do |eqn_character|
			if (eqn_character.match(/[\d]/))
				numeric_val = eqn_character
				push_values(numeric_val)

			else 
				operator_val = eqn_character
				pop_values(operator_val)
			end
			# binding.pry
		end
		@result
	end
	def push_values(numeric_val)
		@p_values << numeric_val
		# binding.pry
	end

	def pop_values(operator_val)
		# push_values.p_values
		o_value = operator_val
		# binding.pry
		b = @p_values.pop.to_f
		a = @p_values.pop.to_f
		case o_value
			when '+'; @result = a +  b
			when '-'; @result = a -  b
			when '*'; @result = a *  b
			when '/'; @result = a /  b
		end
		@p_values << @result
		# binding.pry
	end
end
