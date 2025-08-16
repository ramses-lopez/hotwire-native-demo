class Comment < ApplicationRecord
  belongs_to :post
  
  validates :author, presence: true
  validates :content, presence: true
  
  after_create_commit -> { broadcast_append_to post, partial: "comments/comment", locals: { comment: self }, target: "comments" }
  after_destroy_commit -> { broadcast_remove_to post }
end