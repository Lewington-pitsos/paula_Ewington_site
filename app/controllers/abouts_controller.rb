class AboutsController < ApplicationController
  def edit
    @about = About.first
  end

  def create

  end

  def index
    @about = About.first
  end
end
