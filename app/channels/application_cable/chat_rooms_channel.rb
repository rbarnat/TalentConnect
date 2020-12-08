class ChatRoomsChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_rooms_#{params['chat_room_id']}_channel"
    end

    def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    end

    def send_message(data)
    # process data sent from the page
    end
end
