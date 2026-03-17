# frozen_string_literal: true

class TaskStatusChannel < ApplicationCable::Channel
  def subscribed
    task = Task.find(params[:task_id])
    stream_for task
  end

  def unsubscribed
    stop_all_streams
  end
end
