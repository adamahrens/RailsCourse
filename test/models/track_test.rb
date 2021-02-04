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
require "test_helper"

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
