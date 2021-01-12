class PagesController < ApplicationController
  def landing
    @popular = Track.limit(3)
    @recent = Track.last(3)
    @top = Track.limit(2)
  end

  def privacy
  end

  def about
  end
end
