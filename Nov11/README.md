## Analog and Digital 

### Photograph 
This is what the circuit looked like:

![](20211108_170438.jpg)

###Schematic
This is the drawing of the circuit
![](20211108_171123.jpg)

### Concept
In this project, I was trying to use a digital and analog input and use information from them to control 2 LEDs in a digital and analog way. To do so, I took help from my previous project, previous in class exmaples and some creative thinking. For the digital input I used a push button and used it to control a Red LED digitally by switching it on and off in a certain patter so that it says 'Hi' in morse code. For the analog input I used an LDR. Based on the value of the LDR, I created 2 conditions. If the LDR value was above a certain threshold, it triggered a fading fucntion in one of the LEDs, if the LDR value was below a certain threshold, it created a random pattern of blinking between the two LEDs such that the delay was dependent on the LDR value. The project was simple and simply helped me better understand the difference between analog and digital inputs and outputs.

### Video of the project 
https://drive.google.com/file/d/1zgE1FtU89ZQeQ2OjerGKoGOhjzhzbSes/view?usp=sharing

### My process
First, I began to assemble the circuit based on the previous projects done in class. I simply aligned 2 LEDs, one button and one LDR in the circuit. <br> Then I used basic fucntions from the exmaples to test if everything had been connected correctly and was working. <br>
Then, I began to think of the code and for inspiration I looked at previous class exmaples and selected my favourite ones <br>
I combined my favourtie exmaples and added some randomeness for fun and tried to use the LDR value in a fun way <br>
The final product was an unplanned output, in the sense that I went ahead with whatever numbers felt right and just saw what output they produced.

### Problem
I had to deal with one major problem. My arduino app was failing to upload the code to the arduino board. It was working and suddenly stopped working. then failed to upload any code. I turned towards the discord group for help and the professor shared a list of a few things to try. I thought I had a short ciruit so I tried to remove each item one by one and reupload the code, but that didnt work. Then I tried restarting everything and uplugging everything that too did not seem to work. Then I followed the list given by the professor, step by step. One of the suggestions was to change the usb port and that did the trick for me.



