# frozen_string_literal: true

require 'watir'
require 'faker'
require 'spreadsheet'

browser = Watir::Browser.new
Spreadsheet.client_encoding = 'UTF-8'
information = Spreadsheet::Workbook.new
sheet1 = information.create_worksheet name: 'soundcloud'
sheet1.row(0).push  'Name', 'link'
@url = browser.goto('https://soundcloud.com/discover')
browser.as(class: %w[sc-link-dark sc-type-light playableTile__mainHeading audibleTile__mainHeading playableTile__heading playableTile__audibleHeading audibleTile__audibleHeading sc-truncate sc-font-light]).each do |link|
  sheet1.row(sheet1.last_row_index + 1).push link.text, link.href
  information.write 'soundcloud.xls'
end
browser.close
