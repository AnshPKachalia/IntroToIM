Table words; //creates table


void setup() {
  size(3000, 150);
  background(0);
  words = loadTable("words_alpha.csv", "header"); //strings to load
  randomWords();
}

void draw() {

  fill(255, 0, 0); //set text colour
  textSize(25); //text size
}

void randomWords() {
  for (int i = 0; i<15; i++) {

    TableRow row1= words.getRow((int)random(0, 370100));//selects any random word from all possible words
    String word1= row1.getString("words");//Selects words from the columns "words"
    println(word1); //checking if the code works
    fill(255, 0, 0);
    textSize(25);
    text(word1, i*200, 100);//display 15 words in a row
  }
}
