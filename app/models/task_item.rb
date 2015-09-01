class TaskItem < ActiveRecord::Base
  belongs_to :task

  validates :content, presence: true,
  					  length: { minimum: 2 }

  def completed?
  	!completed_at.blank?
  end


end
