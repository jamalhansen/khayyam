Story: Exporting a single file
  As a user of Khayyam
  I want to export a file with khayyam
  So that I can use the data elsewhere

Scenario: Export a file containing a single category
  Given an object contianing data to export
  When I tell khayaam to export the file
  Then it will export the file
  And it will contain all the data in the original objects

