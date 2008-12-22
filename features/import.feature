Story: Importing a string
  As a user of Khayyam
  I want to import a string with khayyam
  So that I can use it with my application
  
Scenario: Import a string containing a single category
  Given a string containing data to import
  When I tell khayaam to import the string
  Then it will import the string into khayyam
  And it will contain all the data in the string

