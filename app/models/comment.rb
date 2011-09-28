class Comment < ActiveRecord::Base
  belongs_to :subject, :polymorphic => true
  has_many :comments, :as => :subject
  
  def to_tree(buffer = 0)
    [to_leaf(buffer), self.comments.collect{|c| c.to_tree(buffer + 1)}].join("\n")
  end
  
  def to_leaf(buffer = 0)
    ("  " * buffer) + "- Comment #{id}"
  end
end
