class InquiriesController < ApplicationController
  def show
    redirect_to action: 'new'
  end

  def new
    @inquiry = Inquiry.new
    @inquiry.email = 'user@example.com'
  end

  def create
    @inquiry = Inquiry.new(create_params)
    # 入力値のチェック
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.valid?
      MailSender.inquiry(@inquiry).deliver
      render action: 'complete'
    else
      render action: 'new'
    end
  end

  def complete() end

  private

  def create_params
    params.require(:inquiry).permit(:subject, :email, :message)
  end
end
