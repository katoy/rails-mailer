class Inquiry
  include ActiveModel::Model

  attr_accessor :subject, :email, :message

  # メールアドレスフォーマットの検証（完璧な正規表現ではない）
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  SUBJECT_MAX_LENGTH = 256
  EMAIL_MAX_LENGTH = 256
  MESSAGE_MAX_LENGTH = 2048

  validates :subject, presence: true, length: { maximum: SUBJECT_MAX_LENGTH }
  validates :email, presence: true, length: { maximum: EMAIL_MAX_LENGTH }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :message, presence: true, length: { maximum: MESSAGE_MAX_LENGTH }
end
