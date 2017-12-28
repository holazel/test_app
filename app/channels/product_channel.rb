class ProductChannel < ApplicationCable::Channel
  def subscribed
  end

  def unsubscribed
  end

  def listen(data)
  	stop_all_streams
  	stream_for data["product_id"]
  end

end