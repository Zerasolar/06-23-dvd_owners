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
 
     Owners

    -member id - integers
    -dvd id - integers
 
 
##"Should" cases
 
 Here's what I want to be able to do:
 
   -create members
   -edited members
   -delete memebers
   -create titles
   -delete titles
   -fetch all members owns one title
   -edited members username(optional)
   -fetch all titles that has bluray versions(optional)
   -fetch member's own titles
   -fetch all titles that doesn't have a member owning it.

##"Should not" cases

  I should not be able to:
  
    -create a memeber without a name
    -create a dvd without a title
    -create a member with a username, but no name (optional)
    -create a Owners without an title id and name id
    
## Stretches

If I have time those optional tags items will be added in the program will help with adding on to this program. Where I hope to take this where you can take the listing of the dvds to let users vote which one they want to watch that week.

## Requirements
    -at least three models
    -at least one one to many relationship
    -at least one many to many relationship
    -unit test for all business logic
    -ability to fully interact with the application from the browser