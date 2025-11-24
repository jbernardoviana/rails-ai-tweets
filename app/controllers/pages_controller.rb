class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @name = 'ABC'
  end
end
