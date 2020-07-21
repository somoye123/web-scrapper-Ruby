# !/usr/bin/env ruby

require 'csv'
require_relative '../lib/tastee.rb'

tastee = Tastee.new

tastee.scrape

CSV.open('tastee.csv', 'w') do |csv|
  csv << tastee.tastee_locations
end
