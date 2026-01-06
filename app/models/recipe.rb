class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags

  validates :title, presence: true
  validates :body, presence: true

  
  attr_accessor :tag_names

  
  after_save :save_tags

  private

  def save_tags
    return if tag_names.blank?

    tag_list = tag_names.split(",").map(&:strip).uniq

    self.tags = tag_list.map do |name|
      Tag.find_or_create_by(name: name)
    end
  end
end