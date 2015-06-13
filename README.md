# Ruby Snippets
Short scripts in ruby

1. southwest: checkin helper
    - Usage:
    ```ruby
 	ruby checkin.rb confirmNum firstName lastName hh:mm
 	```
	- For example:
 	```ruby
 	ruby checkin.rb 8HYMNP John Doe 15:20
 	```
	- If it is more than 1 minute before your check-in time (24 hour limit by SW), it will exit and ask you to rerun again when there is less than 1 minute on the clock.