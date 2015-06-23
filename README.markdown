#Dvd Owners

Build an application that will be a tool for the an viewing group like a movie club or a anime club to use to figure out which memeber owns which series.
This way if one memeber is out sick the president will know if anyone else has the dvd or if they are out of luck and need to move on the next one on the list.

For example: There are about 50 members in the group that they voted for what they want to view for their meeting that Friday. From that list they vote for the president can look for that anime title and remind the members who owns to to bring their copy or pick up the disk from the member.

#Model Diagrams

    Members
    
    -id(primary key) - integer
    -name - string
    -username(optional) -string
   
    Dvds
    
    -id(primary key) - integer
    -titles - string
    -bluray(optional) - bit field

    Lanuagues
    
    -id(primary key) - integer
    -sub - bit field
    -dub - bit field
 
    Owners

    -member id - integers
    -dvd id - integers
    -lanuagues
 
##"Should" cases
 
 Here's what I want to be able to do:

    -Create members
    -Edited members
    -Delete memebers
    -Create titles
    -Delete titles
    -Create Lanuague by asking admin if they are sure
    -Delete Lanuague by asking admin if they are sure
    -Edit a Lanuague by asking admin if they are sure
    -Fetch all members owns one title
    -Edited members username(optional)
    -Fetch all titles that has bluray versions(optional)
    -Fetch member's own titles
    -Fetch all titles that doesn't have a member owning it.
    -Fetch all titles that are sub(optional)
    -Fetch all titles that are dub(optional)
    -Fetch all titles that are both(optional)
    
##"Should not" cases
    
  I should not be able to:
    
    -Create a memeber without a name
    -Create a dvd without a title
    -Create a member with a username, but no name (optional)
    -Create a Owners without an title id and name id
    -Create a Lanuague 
    -Delete a Lanuague
    -Edit a Lanuague 
    
## Stretches

If I have time those optional tags items will be added in the program will help with adding on to this program. Where I hope to take this where you can take the listing of the dvds to let users vote which one they want to watch that week.

## Requirements
    -At least three models
    -At least one one to many relationship
    -At least one many to many relationship
    -Unit test for all business logic
    -Ability to fully interact with the application from the browser