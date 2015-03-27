class BuildWorker < ActiveRecord::Base
  belongs_to :build

  validates :build, presence: :true

  def completed?
    completed_at?
  end

  def incomplete?
    !completed?
  end
end
