# frozen_string_literal: true

# Serves basic pages
class PagesController < ApplicationController
  def index
    @current_ip = HTTParty.get('http://ifconfig.me')
  end
end
