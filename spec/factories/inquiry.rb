FactoryGirl.define do
  # クラス名＝ファクトリ名
  factory :inquiry do
    subject 'subject'
    email 'foo@example.com'
    message 'message'
  end
end
