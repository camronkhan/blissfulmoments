class MessagesController < ApplicationController
	def new
		@page_title = "Contact"
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		if @message.valid?
			MessageMailer.new_message(@message).deliver_now
			redirect_to contact_path, notice: "Your message has been sent."
		else
			flash[:alert] = "An error occurred while sending the message."
			render :new
		end
	end

	private

		def message_params
			params.require(:message).permit(:name, :email, :content)
		end
end