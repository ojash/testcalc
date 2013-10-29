require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the MainHelper. For example:
#
# describe MainHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe MainHelper do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "#add" do
    it "adds the two mumbers" do
    	#binding.pry
      #main = Main.index
      # helper is an instance of ActionView::Base configured with the
      # EventsHelper and all of Rails' built-in helpers
      expect(sum).to eql "5"
    end
  end
end
