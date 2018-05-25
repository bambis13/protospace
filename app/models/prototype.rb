class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tags_maps, dependent: :destroy
  has_many :tags, through: :tags_maps

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images, allow_destroy: true

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  # ユーザが既にいいねしているか確認する奴
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end

  def update_attributes(attributes)
    with_transaction_returning_status do
      self.attributes = atrributes
      save
    end
  end

  def save_prototypes(tags_list)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
      old_tags = current_tags - tags_list
      new_tags = tags_list - current_tags

          # Destroy old taggings:
      old_tags.each do |old_name|
        self.tags.delete Tag.find_by(name: old_name)
      end

      # Create new taggings:
      new_tags.each do |new_name|
        post_tag = Tag.find_or_create_by(name: new_name)
        self.tags << post_tag
      end
  end

  scope :popular, -> {order('likes_count DESC')}
  scope :newest, -> {order('id DESC')}
  scope :rand, -> {order('RAND()')}
end
