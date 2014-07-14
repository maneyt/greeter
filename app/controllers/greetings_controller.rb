require 'pusher'

class GreetingsController < ApplicationController
  def show
    @greeting = Greeting.new
    @users = User.all 
    @greetings = current_user.received_greetings.order("created_at DESC")
  end

  def create
    greeting = current_user.sent_greetings.create(greeting_params)
    push_greeting = render greeting
    Pusher[greeting.receiver_id.to_s].trigger('new_greeting', {
      greeting_html: push_greeting
    })
  end

  private

  def greeting_params
    params.require(:greeting).permit(:body, :receiver_id)
  end
end
