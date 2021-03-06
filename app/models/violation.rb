# Hold file, line, and violation message values.
# Built by style guides.
# Printed by Commenter.
class Violation < ActiveRecord::Base
  belongs_to :build

  validates :build, presence: true
  validates :filename, presence: true

  attr_writer :line

  delegate :count, to: :messages, prefix: true

  def add_messages(new_messages)
    self[:messages].concat(new_messages)
  end

  def messages
    self[:messages].uniq
  end

  def on_changed_line?
    line.changed?
  end

  private

  attr_reader :line
end
