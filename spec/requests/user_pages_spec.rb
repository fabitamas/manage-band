require 'spec_helper'

describe "User pages" do
	subject {page}

	describe "profile page" do
		let(:member) {FactoryGirl.create(:member)}
		before {visit member_path(member)}

		it {should have_selector('h1', text: member.name)}
		it {should have_selector('title', text: member.name)}
	end

	describe "signup" do
		before {visit '/static_pages/home'}
		let(:submit) {"Sign up!"}

		describe "with invalid information" do
			it "should not create user" do
				expect {click_button submit}.not_to change(Member, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Example User"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "foobar"
				fill_in "Confirm password", with: "foobar"
			end
			it "should create a user" do
				expect {click_button submit}.to change(Member, :count).by(1)
			end
		end
	end
end