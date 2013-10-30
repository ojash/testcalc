require 'spec_helper'

describe "conversion from infix to post fix expression" do
	before :each do
		visit "/"
	end
	it "should convert to postfix" do 
		fill_in "q", :with => "2+5"
		click_button "Calculate"
		expect(page).to have_content "25+"
	end
	it "should convert to postfix" do 
		fill_in "q", :with => "2*3-4/5"
		click_button "Calculate"
		expect(page).to have_content "23*45/-"
	end
	it "should convert to postfix" do 
		fill_in "q", :with => "1+2+3-4/45+34+34*23+3/4*5-2"
		click_button "Calculate"
		expect(page).to have_content "12+3+445/-34+3423*+34/5*+2-"
	end	
	it "should convert all to postfix" do
		values = {
			"2+5" => "25+",
			"2*3-4/5" => "23*45/-",
			"1+2+3-4/45+34+34*23+3/4*5-2" => "12+3+445/-34+3423*+34/5*+2-"
		}
		values.each do |ip, op|
			fill_in "q", :with => ip
			click_button "Calculate"
			expect(page).to have_content op
		end
	end
end