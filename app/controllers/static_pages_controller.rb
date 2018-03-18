class StaticPagesController < ApplicationController
  def about
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email, to:'malin.ekelund@gmail.com', subject: "A new contact message from #{@name}", body: @message).deliver_now
  end

end
