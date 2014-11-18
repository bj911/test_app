class Post < ActiveRecord::Base
  default_scope order('created_at DESC')
  scope :post_by_message_type, ->(message_type) { where(:message_type => message_type)}
  validates_inclusion_of :message_type, :in => %w(ajax js_erb submit)
  validates_presence_of :message
end
