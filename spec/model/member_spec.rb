require 'spec_helper'

describe Member do

	before {@member = Member.new(name: "Test User", email: "test@example.com", 
		password: "foobar", password_confirmation: "foobar")}

	subject {@member}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:password_digest)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:authenticate)}

	it {should be_valid}

	describe "when name is not present" do
		before {@member.name = " "}
		it {should_not be_valid}
	end

	describe "when email is not present" do
		before {@member.email = " "}
		it {should_not be_valid}
	end

	describe "when name is too long" do
		before {@member.name = "a" * 41}
		it {should_not be_valid}
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
			 foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@member.email = invalid_address
				@member.should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.com A_US-ER@f.b.org frst.lst@foo.jp
			 a+b@baz.cn]
			addresses.each do |valid_address|
				@member.email = valid_address
				@member.should be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			member_with_same_email = @member.dup
			member_with_same_email.email = @member.email.upcase
			member_with_same_email.save
		end

		it {should_not be_valid}
	end

	describe "when password is not present" do
		before {@member.password = @member.password_confirmation = " "}
		it {should_not be_valid}
	end

	describe "when password is too short" do
		before {@member.password = @member.password_confirmation = "a" * 5}
		it {should be_invalid}
	end

	describe "when password doesn't match confirmation" do
		before {@member.password_confirmation = "mismatch"}
		it {should_not be_valid}
	end

	describe "when password confirmation is nil" do
		before {@member.password_confirmation = nil}
		it {should_not be_valid}
	end

	describe "return value of authenticate method" do
		before {@member.save}
		let(:found_member) {Member.find_by_email(@member.email)}

		describe "with valid password" do
			it {should == found_member.authenticate(@member.password)}
		end

		describe "with invalid password" do
			let(:member_with_invalid_password) {found_member.authenticate("invalid")}

			it {should_not == member_with_invalid_password}
			specify {member_with_invalid_password.should be_false}
		end
	end

end