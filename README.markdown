#Dvd Owners

Build an application that will be a tool for the an viewing group like a movie club or a anime club to use to figure out which memeber owns which series.
This way if one memeber is out sick the president will know if anyone else has the dvd or if they are out of luck and need to move on the next one on the list.

For example: There are about 50 members in the group that they voted for what they want to view for their meeting that Friday. From that list they vote for the president can look for that anime title and remind the members who owns to to bring their copy or pick up the disk from the member.

#Model Diagrams

    Members
    
    -id(primary key) - integer
    -name - string
    -username(optional) -string
   
    Anime_Serial
    
    -id(primary key) - integer
    -titles - string
  

    Format_Type
    
    -id(primary key) - integer
    -name - string
 
    Media

    -id(primary key) - integer
    -format_id - integer
    -anime_id - integer
    -name - string
    
    Media members
    
    -member_id - integer
    -media_id - integer
 
##"Should" cases
 
 Here's what I want to be able to do:

    -Create members name
    -Edited members name
    -Delete members name
    -Create anime series title
    -Delete anime series title
    -Edit anime series title
    -Create format type
    -Delete format type
    -Edit a format type
    -Create media table format_id, anime_id, name
    -Delete media table format_id, anime_id, name
    -Edit media table format_id, anime_id, name
    -Create members username(optional)
    -Edited members username(optional)
    -Delete members username(optional)
    -Create media members member_id and media_id
    -Fetch all members owns the media
    -Fetch format types for media(optional)
    
##"Should not" cases
    
  I should not be able to:
    
    -Create a memeber without a name
    -Create a anime without a title
    -Create a member with a username, but no name (optional)
    -Create a media without an format id and anime id(optional)
    -Create a format without a name
    -Create two of the same username(optional)
    -Create two of the same title(optional)
    
## Stretches

If I have time those optional tags items will be added in the program will help with adding on to this program. Where I hope to take this where you can take the listing of the dvds to let users vote which one they want to watch that week.

## Requirements
    -At least three models
    -At least one one to many relationship
    -At least one many to many relationship
    -Unit test for all business logic
    -Ability to fully interact with the application from the browser