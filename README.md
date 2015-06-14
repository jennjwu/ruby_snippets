# Ruby Snippets
Short scripts in ruby

1. southwest: checkin helper
	- requires selenium-webdriver:
	```
     gem install selenium-webdriver
     ```
    - Usage:
    ```
 	ruby checkin.rb confirmationNum firstName lastName hh:mm
 	```
	- For example:
 	```
 	ruby checkin.rb 8HYMNP John Doe 15:20
 	```
	- If it is more than 1 minute before your check-in time (there is a 24 hour limit by SW), script will exit and ask you to rerun it again when there is less than 1 minute on the clock.