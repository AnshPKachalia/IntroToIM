## Day 1
<ul>
  <li>Today, was my brainstorming day.
<li> I thought about cool projects that I could make and looked at projects from previous sessions
  <li> I stumbled upon pong and remembered what a fun game it was so I decided to recreate it
    <li>I am excited to see how it pans out </ul>
    

## Day 2
<ul>
  <li> My task was to get started with the most complicated things in the project
    <li> In my opinion the ball mechanism was a big challenge as it had to bounce a certain way, increase in speed, had to die out if it touched the right or left edge only
      <li> Started with the ball, figured out the bounce mechanism and increasing speed. Unable to figure out how to end the round when it hits the width of the screen.
        <li> I am thinking of adding a wind component to the ball, just to add some challenge for the players. But I dont know if it will work well.
          <li> Thinking of adding an LCD to indicate the score
        </ul>
        
## Day 3
<ul>
  <li> Focussed on different things today
    <li> Made the introscreen, with the original pong text and set it such that pressing space triggers the main game
      <li> Made changes to speed and bounce mechanisms
        <li> Facing a lag issue. More than one ball on the screen at any point. Can lead to user confusion. Must find a fix. Asked on the discord channel
          <li> Problem illustrated in this video: https://drive.google.com/file/d/1Qxkt9FsCjmaRPXf9MspU0YoPL5xJ3F3M/view?usp=sharing
           <li> figured out how to end the round when ball hits the side
             <li> Decided against adding the LCD as it is a bit of an eyesore and inconvenient for users to track score. The game is a bit fast paced and to look at the score users are forced to look away from the game screen, which works against them.
             <li> feeling good about today's progress, as I got a lot of smaller things out of the way and now my games looks like something more than just a bouncing ball. 
          </ul>

## Day 4
<ul>
  <li> Got in touch with professor about lag issue. Learnt that it is an inherent issue that cannot really be solved.
    <li> Attended a soldering workshop
      <li> Realized that I needed bigger potentiometers for my game. So I borrowed some from the lab and went after hours to the open soldering stations to solder wires onto the potentimeter.
        <li> Soldering was really fun and definitelty a new skill that I had learnt. I attended the workshop just for fun, but I am glad that I was able to apply my learnings to better my project
        </ul>
        
## Day 5
<ul>
  <li> Connected my new potentiometers to the circuit to make sure that had been soldered properly and created no short circuits.
      <li> Trouble receiving information from two potentiometers and using them to control each paddle separately
        <li> Suspected short circuit, but then used each potentiometer individually and it worked. Realized that there must be some code error
          <li> Asked to discuss doubt with professor in class
            <li> I am considering using normal potentiometers if I am unable to figure out how to get soldered ones to work
            </ul>
            
## Day 6 
<ul>
  <li>Explained problem in class. Realized that I was not sending the data from Arduino like I wanted to receive it in Processing. Had to add a comma in arduino to be able to read and split them in processing. Professor helped me figure that out
    <li> Realized there was an issue with my collision mechanism as the ball was touching the bar but not bouncing off. Realized that I had to add y value of paddle plus width to make sure the correct edge of the paddle was checking for collision.
      <li> Optimized end game page
        <li> Wanted to add wind function such that the wind would be against the individual with a higher score
          <li> Realized that I was not too comfortable with p-vectors and was not getting the desired change. Instead added a feature such that as an individual's score increases, their paddle size decreases, making it harder for them to win.
              </ul>
              
## Day 7
 <ul>
  <li> Used 3 suitemates for user testing
    <li> Received a lot of useful feedback that I need to include
      <ol>
        <li> Make a stable support for the potentiometers so its easier for individuals to keep it on a table and play
          <li> Make an instruction page, informing users about the rules of the game
            <li> Make an option to restart the game 
              <li> Collision mechanism is still a little glitchy
                <li> I should also add some music
                  <li> Paddle size is a little small. Making the game more difficult
                    <li> Users dont know which controller controls which paddle
      </ol>
      <li> I got amazing feedback from them. They pointed out minor things that I was missing. I am unable to upload a video as my users were not comfortable being recorded. 
      </ul>
   
## Day 8
<ul>
  <li> Music Added
    <li> Restart figured, facing an issue where the end screen was being trigerred directly after the introscreen post restrart. Realized I needed to reset player scores
      <li> Colission mechanism better but still needs to be worked on
        < li> Instruction page made
          <li> Paddle Size increased
            <li> Colors added to paddles and controllers
              <li> I am now at a stage where my game seems more or less done. I am simply adding minor features to make it slightly better and user friendly.
          </ul>
          
 ## Day 9
 <ul> 
  <li> Last day today
    <li> Made a holder for each of the potentiometers, so people can play properly
      <li> Finally figured out collision using online resources 
        <li> Conducted a little more user testing to see if the changes made were helpful or not
          <li> Received feedback that I looks like 1, so changed that as the key for instructions. Also user said font is hard to read. 
          <li> Tidied up the code and documentation
            <li> I also learnt a bit about the creative process. It is important to design a game how you want but then even more important to get user feedback. Users point out so many things that, I as the creator did not even consider. 
            </ul>
            
     

