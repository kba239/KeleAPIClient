require 'httparty'

class Kele
  include HTTParty



  attr_accessor :email, :password

  def initialize(email, password)
    @email, @password = email, password
    sessions_url = 'https://www.bloc.io/api/v1/sessions'
    # url = 'https://www.bloc.io/api/v1'
    @auth = {email: @email, password: @password}
    options = { basic_auth: @auth }
    @token = self.class.post(sessions_url, @auth)
  end

  # def get_me
  #   response = self.class.get(url, headers: { "authorization" => @token })
  # end
end
