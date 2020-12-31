class MessagesController < ApplicationController
    before_action :set_user, only: [ :new, :create, :update, :destroy ]
  
    def new
      @message = @user.messages.new
    end
  
    def create
      @message = @user.messages.create!(message_params)

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @user }
      end
    end

    def update
        @message = @user.messages.update!(message_params)

        respond_to do |format|
            format.turbo_stream
            format.html { redirect_to @user }
        end
    end
  
    private
      def set_user
        @user = current_user
      end
  
      def message_params
        params.require(:message).permit(:content)
      end
end