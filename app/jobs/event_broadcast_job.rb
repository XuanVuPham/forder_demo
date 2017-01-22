class EventBroadcastJob < ApplicationJob
  queue_as :default

  def perform counter, event
    ActionCable.server.broadcast "notification_channel_#{event.user_id}", counter: render_counter(counter),
      event: render_event(event)
  end

  private

  def render_counter counter
   ApplicationController.renderer.render partial: "events/counter", locals: {counter: counter}
  end

  def render_event event
    ApplicationController.renderer.render partial: "events/event", locals: {event: event}
  end
end
