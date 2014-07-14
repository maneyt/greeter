class User < ActiveRecord::Base
  has_many :sent_greetings, class_name: "Greeting", foreign_key: :sender_id
  has_many :received_greetings, class_name: "Greeting", foreign_key: :receiver_id
end
