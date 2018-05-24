class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
# コメントと
  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images

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

  scope :popular, -> {order('likes_count DESC')}
  scope :newest, -> {order('id DESC')}
  scope :rand, -> {order('RAND()')}
end
