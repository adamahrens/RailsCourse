# == Schema Information
#
# Table name: tracks
#
#  id          :bigint           not null, primary key
#  description :text
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
    validates :title, presence: true
    validates :description, presence: true

    friendly_id :title, use: :slugged

    has_rich_text :description

    belongs_to :user
end
