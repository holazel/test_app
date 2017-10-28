#require 'rails_helper'

#describe User do 
#  context "testing validations" do
   
#    it 'requires email address' do
#     expect(User.new(email: nil)).not_to be_valid
#   end
# end
#end
require "rails_helper"

describe User, type: :model do
	it "should no validate users without an emial address" do
		@user = FactoryGirl.build(:user, email: "not_an_email")
		expect(@user).to_not be_valid
	end
end