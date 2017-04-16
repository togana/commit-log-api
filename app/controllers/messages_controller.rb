class MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  # GET /messages?search=xxx
  # GET /messages?search[0]=xxx&search[1]=xxx
  def index
    if params[:search].present?
      @message = Message.full_text_search(params[:search]).limit(100)
    else
      @message = Message.limit(100)
    end
    render json: @message
  end

  # GET /messages/xxx
  def show
    render json: @message
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find_by(sha: params[:id])
    end
end
