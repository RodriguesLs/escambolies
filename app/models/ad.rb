class Ad < ActiveRecord::Base
  belongs_to :member
  belongs_to :category
  
  scope :last_six, -> {limit(6).order(created_at: :desc)}
  
  # paperclip
  has_attached_file :picture, styles: { medium: "320x150#", thum: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  #gem money-rails
  #monetize :price_cents
end
