import drop.*;
import java.io.*;
Screen currentScreen, screen1;
SDrop dropbox;
PFont arialFont;
PFont buttonFont;
String programPath;
TextWidget keywordSearch;
TextWidget focus;
Widget clickButton;
ArrayList<String> filePath;
ArrayList<String> fileName;
int nextFileY;
void settings(){
  size(SCREEN_X, SCREEN_Y);
}

void setup(){
  screen1 = new Screen(BACKGROUND_COLOUR);
  currentScreen = screen1;
  dropbox = new SDrop(this);
  arialFont = loadFont("Arial-Black-22.vlw");
  buttonFont = loadFont("AngsanaUPC-Bold-20.vlw");
  keywordSearch = new TextWidget(50, 360, 300, 30, "", "thai", color(235), arialFont, SEARCH_WIDGET);
  clickButton = new Widget(100, 400, 200, 20, "Generate highlighted file(s)", 20, -5, color(200), buttonFont, CLICK_BUTTON);
  screen1.addWidget(keywordSearch);
  screen1.addWidget(clickButton);
  filePath = new ArrayList<String>();
  fileName = new ArrayList<String>();
  screen1.addRect(new int[]{20, 20, 360, 250, 255});
  nextFileY = 20;
}

void draw(){
  currentScreen.draw();
  
}

void mouseMoved(){
  int event = currentScreen.getEvent(mouseX, mouseY);
  switch(event){
    case SEARCH_WIDGET:
      keywordSearch.borderColour = 255;
      break;
    case CLICK_BUTTON:
      clickButton.borderColour = 255;
      break;
    default:
      clickButton.borderColour = 0;
      keywordSearch.borderColour = 0;
  }
}

void mousePressed(){
  int event = currentScreen.getEvent(mouseX, mouseY);
  switch(event){
    case SEARCH_WIDGET:
      focus = keywordSearch;
      focus.labelColor = color(0);
      focus.typing = true;
      focus.focus = true;
      break;
    case CLICK_BUTTON:
      for (int i = 0; i< filePath.size(); i++){
        runScript("program path", filePath.get(i), "keyword", "path to put new file");
        System.out.println("Done");
      }
      break;
    default:
      focus.typing = false;
      focus.focus = false;
      focus = null;
  }
}

void keyPressed() {
  if (focus == keywordSearch) {
    if (key == ENTER || key == RETURN) {
      focus.focus = false;
      focus = null;
    }
    else {
      focus.append(key);
    }
  }
}

void dropEvent(DropEvent theDropEvent){
  if (theDropEvent.isFile()){
    File myFile = theDropEvent.file();
    println("\nisDirectory ? " + myFile.isDirectory()+ "  /  isFile ? " + myFile.isFile());
    
    if(myFile.isDirectory()) {
      println("listing the directory");
    }
    else{
      filePath.add(myFile.getAbsolutePath());
      fileName.add(myFile.getName());
      print(filePath.get(0));
      screen1.addWidget(new Widget(20, nextFileY, 360, 20, myFile.getName(), 5, -3, 255, buttonFont, EVENT_NULL));
      nextFileY += 20;
    }
  }
}

void runScript(String path, String argument1, String argument2, String argument3){
  try{
    String s = null;
    Process process = Runtime.getRuntime().exec(String.format("python %s %s %s %s", path, argument1, argument2, argument3));
    BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
    while((s = in.readLine())!= null){
      System.out.println(s);
    }
  }
  catch(IOException e){
    e.printStackTrace();
  }
}
