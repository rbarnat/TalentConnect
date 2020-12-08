class MessageBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                   message: 'MESSAGE_HTML'
    end

    def render_message(message)
        MessagesController.render partial: 'messages/message', locals: {message: message}
    end

  end