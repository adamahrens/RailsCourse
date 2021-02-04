# == Schema Information
#
# Table name: tracks
#
#  id          :bigint           not null, primary key
#  description :text
#  language    :string           default("English"), not null
#  level       :string           default("Beginner"), not null
#  price       :integer          default(0), not null
#  short       :text
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_tracks_on_slug     (slug) UNIQUE
#  index_tracks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Track < ApplicationRecord
    extend FriendlyId
    include PublicActivity::Model
    tracked owner: Proc.new { |controller, model| controller.current_user }

    validates :title, presence: true
    validates :description, presence: true
    validates :short, presence: true
    validates :language, presence: true
    validates :level, presence: true
    validates :price, presence: true

    friendly_id :title, use: :slugged

    has_rich_text :description

    belongs_to :user
end
