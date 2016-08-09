class StaticPagesController < ApplicationController
  def home
    @page_title = "Home"
  end

  def about
    @page_title = "About"
  end

  def investment
    @page_title = "Investment"
  end

  def studio
    @page_title = "Studio"
  end

  def contact
    @page_title = "Contact"
  end

  def clients
    @page_title = "Clients"
  end
end
