class Item < ApplicationRecord
  has_rich_text :content
  validates :date, :topic, :subtopic, :content, presence: true
  scope :order_by_date_desc, -> { order(date: :desc, created_at: :desc) }
  scope :any_topic_of, ->(topic_filter) { where(topic: topic_filter) }
  # scope :keyword, ->(word) { where('content ILIKE ?', "#{word}%") }
  scope :keyword, ->(word) { joins(:rich_text_content).where("action_text_rich_texts.body ILIKE ?", "%#{word}%") }
  scope :order_by_date_desc, -> { order(date: :desc) }
  scope :order_by_topic, -> { order(:topic, :subtopic, date: :desc) }
  scope :order_by_subtopic, -> { order(:subtopic, :topic, date: :desc) }

  def self.topics
    order(topic: :asc).distinct(:topic).pluck(:topic)
  end

  def deletable?
    true
  end

  def editable?
    true
  end
end
