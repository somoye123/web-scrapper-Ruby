require 'nokogiri'
require 'httparty'

class Tastee
  attr_reader :tastee_locations, :url, :parsed_page

  def initialize
    @url = 'https://www.tfc.com.ng/locations'
    @tastee_locations = []
    @parsed_page = nil
  end

  def scrape(csv)
    @parsed_page = parse_url(@url)
    @parsed_page.css('div.branch_location').each do |location|
      unique_resturant = []
      area = location.css('h3').text
      address = location.css('h4 > span').first.text
      delivery_schedule = location.css('h4 > span').last.text
      unique_resturant << area
      unique_resturant << address
      unique_resturant << delivery_schedule
      csv << unique_resturant
      @tastee_locations.push(unique_resturant)
    end
  end

  private

  def parse_url(url)
    unparsed_page = HTTParty.get(url)
    Nokogiri::HTML(unparsed_page)
  end
end
