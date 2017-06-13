require 'pry'
require 'kele'
RSpec.describe Kele do
  #
  # describe "initialize" do
  #   it "should have email and password attributes" do
  #     expect(user).to have_attributes(email: email, password: password)
  #   end
  # end

  describe "retrieving session token" do
    it "authenticates given correct email and password" do
      kele = Kele.new("adams.kate.b@gmail.com", "#D3v3l0p17")
      # binding.pry
      expect(kele).to eq("token")
    end
  end

end
