class MessagesController < ApplicationController
    before_action :set_user, only: [ :new, :create, :update, :destroy ]
  
    def new
      @message = @user.messages.new
    end
  
    def create
      @message = @user.messages.create!(message_params)
  
      redirect_to @user
    end

    def update
        @message = @user.messages.update!(message_params)
    end
  
    private
      def set_user
        @user = current_user
      end
  
      def message_params
        params.require(:message).permit(:content)
      end
end