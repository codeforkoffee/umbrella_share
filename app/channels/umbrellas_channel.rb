class UmbrellasChannel < ApplicationCable::Channel
  def subscribed
    stream_from "umbrellas_#{params['umbrella_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], umbrella_id: data['umbrella_id'])
  end
end