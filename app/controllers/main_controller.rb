class MainController < ApplicationController
	def index
	end
	def calculate
		#binding.pry
		if equation_validate(params[:q])
			p_eqn = to_postfix(params[:q])
			redirect_to main_index_path,:notice=> p_eqn.join 
		else
			redirect_to main_index_path,:notice=>"invalid character"
		end
	end

	private
	def equation_validate(eqn)
		eqn.match(/[^\d\/\-\/*()+%]/) ? false :true
	end
	def to_postfix(eqn)
		eqn = eqn.split("")
		p_stack = Array.new
		p_string = Array.new
		temp = ""
		counter = 0
		#binding.pry
		eqn_length = eqn.length
		eqn.each do |eqn_char|
			if (eqn_char.match(/[\d]/))
				temp = temp + eqn_char
			elsif (eqn_char.match(/[\/\-\/*()+%]/))
				if temp
					p_string << temp
					temp = ""
				end
				if p_stack.empty?
					p_stack << eqn_char
				else
					flag = true
					#binding.pry
					while (flag and !p_stack.empty?)
						if o_presedence(eqn_char, p_stack.last)
							p_stack << eqn_char
							flag = false #it means the characer has been pushed in stack
						else
							p_string << p_stack.pop
						end
					end
					if flag
						#binding.pry
						p_stack << eqn_char
					end
				end
			end		
		end
		p_string << temp
		temp = ""
		if p_stack.empty?
			p_string
		else
			temp_p_stack = p_stack.dup
			p_stack.each do |stack_char|
				#binding.pry
				p_string << temp_p_stack.pop
				#binding.pry
			end
			p_string
		end
	end
	def o_presedence(eqn_char, stack_char)
		prece_tebl = ["-","+","","/","*"]
		if (prece_tebl.index(eqn_char) - prece_tebl.index(stack_char)) > 1
			true
		else
			false
		end
	end
end
