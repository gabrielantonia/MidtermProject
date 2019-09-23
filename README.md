Skill Distillery: Midterm Project (Weeks 10-11) 

Team Name: Shrieking Rhinos

Project Title: [ C A R M A ]

Developers: Justin Choi, Gabriel Antonia, Josh Robbins, Connor Campora

Technologies Used: Spring Boot, Git/GitHub, mySQL Workbench, MAMP, SpringToolsuite4

About: [ C A R M A ] is a functional social-media website created in a nine-day sprint used to cast shame at bad car parkers! The application is intended to shame poor parking and let those who shall not be named know the evil of their ways through the power of social pressure.

How to use [ C A R M A ]: 

1. Entering the site: Upon entering the site a user is shown a slideshow of recently uploaded "parking-fails" (pictures of vehicles parked terribly), a navigation bar and information pertaining to the site and its developers at the bottom of the page. 

2. Creating a user account: to use the full potential of [ C A R M A ] a user must create a user account. When a user clicks on the navbar's "Sign In" button, if the user does not already have a user account then the user is able to create a new account. The user is asked to enter the usual information sites need for an account including a unique username and password. Once the user enters the aforementioned information the site will persist the information the user enters into the [ C A R M A ] database. On the profile page, a stock picture is able to be used as a placeholder and the user is able to upload a image by hovering over the image. The user's profile will also display the date of account creation, the user's email address, and user metrics including user comments, number of Carma posts as well as the number of Carma votes. These numbers are cumulative and persists throughout the user's account life.

4. Creating, Updating and Deleting (CRUDing) "parking-fails" via the logged in user page: A user's logged in page will display any "parking-fails" a user has created. A user is able to view the details of that specific "car-fail" via the "view" button which takes them to the "parking-fail" page. A user can also update the details of that "parking-fail" via the update button attached to the bottom of the "parking-fail" photo.

5. Gallery page: on the navigation bar there is an option for the user to click on called "Gallery". This button takes a user to the gallery.jsp page allowing users to browse all of the various car fails that have been posted to the site. Currently there are 20 pre-populated "parking-fails" that the gallery.jsp will display initially as well as any additional "parking-fails" that are added to the site. A user is able to click on the "parking-fail" thumbnail which brings it to that "parking-fail" page.

6. Parking Fail page: the parkingfail.jsp displays a specified "parking-fail" photo along with a description and name above. In the photo there is a button that reads "BAD CARMA! + (thumbs down symbol)" which allows a user to add "bad Carma" to a "parking-fail". This page allows users to collectively decide which "parking-fails" are the worst and whether or not users agree that a specific "parking-fail" deserves bad carma. This page also displays any information about the vehicle in question such as the vehicles description, make, model and color. Below the picture and "Bad Carma" button is a comments box which allows a user to vent their frustrations on a "parking-fail". The user persists their comments for the specfied "parking-fail" by clickign the submit button below the comments box.

7. Wall of Shame page: the wallofshame.jsp allows a user to view the top "parking-fails" via their carma rating. The higher number of bad carma's that a "parking-fail" has will display those "parking-fails" in their respective or "dis-respective" orders. This page also displays the vehicle's make, model as well as the title that a user gives the "parking-fail". When a user mouses over a "parking-fail" row on this page, that row is highlighted. If the user clicks on that row, the user is taken to that vehicle's parkingfail.jsp (see section #6 above for more information regarding the parkingfail.jsp).

8. User and Logout Pages. When a user is logged in to the site they will see their name or whatever name they've given to create their accounts in the navigation bar. Clicking on their account name will take them to their user page. Clicking logout will log the user out and end their session thus making them a guest of the site.

9. Viewing the site as a non-account user: the functionality for non-account users is functionaly similar to account users however non-account users are unable to create "parking-fails" as well as unable to comment and or view other comments from other users and on other parking fails. The purpose of the non-account users is to allow prospective account holders 

Goals Accomplished:
1. Created a basic functioning social networking site after 12 days of development.
2. Full Create Update and Delete (CRUD) functionality for users to add, update, and delete "parking fails" via their own personal user page.
3. Allow [ C A R M A ] users to successfully shame bad parkers.

Stretch Goals:
1. Allow users to add profile pictures via their local hard drive.
2. Create links to local parking enforcement offices where users are able to report recorded bad parking.
3. Allow users to login via Facebook, Twitter and Google Accounts accounts.
4. Populate parking fails based on user location.
5. Search all vehicles by drop down to include make, model, color and year.
6. Develop a mobile application interface that allows the application to utilize the camera of the user's phone for maximum  ease of use.

Lessons Learned:
1. Don't work on on the master branch & always pull before you push.
2. Communicate with team members often, effectively and with intent (be specific!) and attention to detail.
3. Understand team members' strengths and weaknesses and utilize their strengths and "swarm" on the areas where that individual is "blocked". Retrain and teach where needed, however mission first, meet the deadline.
4. Attempt to fully plan out the intended finished project with room for stretch goals within the database, otherwise it can be a challenge to alter data further along during project development we ran into this issue with user comments on the "parking-fail" page.
