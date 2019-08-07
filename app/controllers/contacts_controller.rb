class ContactsController < ApplicationController

    def index
      @contacts = Contact.all
      render json: @contacts
    end

    def create
      UserMailer.contact(params[:email], params[:message]).deliver_later
      render json: {message: 'Thanks, give us 48 hours!'}
    end
end
