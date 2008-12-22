Story: Exporting a single file
  As a user of Khayyam
  I want to export a file with khayyam
  So that I can use the data elsewhere

Scenario: Export a file containing a single category
  Given an object containing data to export
  When I tell khayaam to export the file
  Then it will export the file
  And it will contain all the data in the original objects
  
Scenario: Export a file containing multiple categories
  Given an object containing multiple categories to export
  When I tell khayaam to export the file
  Then it will export the file
  And it will contain all the data and categories in the original objects

