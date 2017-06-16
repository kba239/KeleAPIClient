require 'httparty'
require 'json'
require 'pry'

class Kele
  include HTTParty



  attr_accessor :email, :password

  def initialize(email, password)
    @email, @password = email, password
    sessions_url = 'https://www.bloc.io/api/v1/sessions'

    response = self.class.post(sessions_url, body: {email: @email, password: @password})
    @token = response["auth_token"]
  end

  def get_me
    response = self.class.get("https://www.bloc.io/api/v1/users/me",
                              headers: { "authorization" => @token })
    JSON.parse(response.body)
  end
end
