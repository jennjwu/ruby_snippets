def checkin(confNum, fname, lname, dTime)
  require "selenium-webdriver"
  require "time"

  if Time.parse(dTime) > Time.now
    puts "Check in time:  #{Time.parse(dTime)}"
    puts "Now:            #{Time.now}"
    if Time.parse(dTime) > Time.now + 60
      puts "Please run me again in %d more minutes" % ((Time.parse(dTime) - Time.now + 60)/60-1)
      exit
    else
      puts "Sleeping for %d seconds before trying again" % (Time.parse(dTime) - Time.now - 5)
      sleep(Time.parse(dTime) - Time.now - 5)
    end
  end

  driver = Selenium::WebDriver.for :firefox
  driver.navigate.to "http://southwest.com"

  #click checkin tab button
  driver.find_element(:id, 'booking-form--check-in-tab').click

  #find and type confirmation number, names
  driver.find_element(:id, 'confirmationNumber').send_keys confNum
  driver.find_element(:id, 'firstName').send_keys fname
  driver.find_element(:id, 'lastName').send_keys lname

  #click 'check-in' button
  driver.find_element(:id, 'jb-button-check-in').click

  if driver.find_element(:id, 'oopsSuccesses').text.length > 0
    error = driver.find_element(:id, "errors")
    puts "*****ERROR*******"
    puts error.text
  else
    #check in and get boarding info
    driver.find_element(:id, 'printDocumentsButton').click

    alert = driver.find_element(:css, 'div.swa-alert-success .swa-alert--title').text
    puts alert

    boardClass = driver.find_element(:css, 'div.itinerary_content td.boarding_group > span.boardingInfo').text
    boardNum = driver.find_element(:css, 'div.itinerary_content td.boarding_position > span.boardingInfo').text

    puts "#{boardClass} #{boardNum}"
  end

  driver.quit
end

if ARGV.length != 4
  puts "Usage: ruby checkin.rb confirmation# firstName lastName departureTime"
else
  checkin(ARGV[0],ARGV[1],ARGV[2],ARGV[3])
end
