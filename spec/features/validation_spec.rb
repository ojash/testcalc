require "spec_helper"

describe "validation for input" do
	it "should not contain characters except 0..9, +, -, * , /, %, (, )" do 
		visit "/"
		fill_in "q", :with => "a+5"
		click_button "Calculate"
		expect(page).to have_content "invalid character"
	end
end