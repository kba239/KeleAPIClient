require 'httparty'
require 'json'
require 'pry'
require './lib/roadmap'

class Kele
  include HTTParty
  include Roadmap

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

  def get_mentor_availability(mentor_id)
    response = self.class.get("https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability",
                              headers: { "authorization" => @token })
    JSON.parse(response.body)
  end

end
