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

  def get_messages(page=nil)
    if page
      response = self.class.get("https://www.bloc.io/api/v1/messages/#{page}",
                                headers: { "authorization" => @token })
    else
      response = self.class.get("https://www.bloc.io/api/v1/messages",
                                headers: { "authorization" => @token })
    end
    JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, token, subject, stripped_text)
    response = self.class.post("https://www.bloc.io/api/v1/messages",
                              headers: { "authorization" => @token },
                              body: {sender: sender, recipient_id: recipient_id, token: @token, subject: subject, stripped_text: stripped_text})
    JSON.parse(response.body)
  end

end
