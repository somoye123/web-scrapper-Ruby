require 'nokogiri'
require 'httparty'

class Tastee
  attr_reader :tastee_locations, :url

  def initialize
    @url = 'https://www.tfc.com.ng/locations'
    @tastee_locations = []
  end

  def scrape
    parsed_page = parse_url(@url)
    parsed_page.css('div.branch_location').css('h4 > span').map do |address|
      location_address = address.text
      @tastee_locations.push(location_address)
    end
  end

  private

  def parse_url(url)
    unparsed_page = HTTParty.get(url)
    Nokogiri::HTML(unparsed_page)
  end
end
