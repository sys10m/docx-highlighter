class Widget{
  int x, y, width, height;
  String label;
  int event, textAlignment;
  color widgetColor, labelColor, borderColour;
  PFont widgetFont;
  boolean pressed;
  int textOffsetX;
  int textOffsetY;

  Widget()
  {
    textAlignment = LEFT;
    labelColor=color(0);
    borderColour=color(0);
    textOffsetX=10;
    textOffsetY=-10;
    pressed=false;
  }
  Widget(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event, int textAlignment) {
    this();
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    this.textAlignment = textAlignment;
    textOffsetX=10;
    textOffsetY=-10;
  }

  Widget(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event) {
    this();
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    textOffsetX=10;
    textOffsetY=-10;
  }

  Widget(int x, int y, int width, int height, String label, int textOffsetX, int textOffsetY,
    color widgetColor, PFont widgetFont, int event) {
    this();
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    this.textOffsetX=textOffsetX;
    this.textOffsetY=textOffsetY;
  }
  
  void draw() {
    textAlign(textAlignment);
    stroke(borderColour);
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    textFont(widgetFont);
    text(label, x+textOffsetX, y+height+textOffsetY);
  }
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    pressed=false;
    return EVENT_NULL;
  }
  
}
class TextWidget extends Widget {
  int maxlength = 66;
  String caret = "";
  String startingMessage;
  int caretBlink = 0;
  boolean focus = false;
  boolean typing = false;
  
  TextWidget(int x, int y, int width, int height, String label, String startingMessage,
    color widgetColor, PFont widgetFont, int event) {
    super(x, y, width, height, label, widgetColor, widgetFont, event);
    this.labelColor = TEXT_BLANK_COLOUR;
    this.startingMessage = startingMessage;
  }
  void append(char s) {
    if (s == BACKSPACE) {
      if (!label.equals(""))
        label = label.substring(0, label.length()-1);
    }
    else if (label.length() < maxlength) {
      if (label.equals(startingMessage) && !typing) {
        label="";
        labelColor=TEXT_TYPE_COLOUR;
        label=label+str(s);
      }
      else if (key != ENTER && key != RETURN)
        label=(label+str(s));
    }
  }
  void draw() {
    stroke(borderColour);
    fill(widgetColor);
    rect(x, y, width, height);
    textCaret();
    textFont(widgetFont);
    fill((label == "")? TEXT_BLANK_COLOUR : labelColor);
    text(((label == "")? startingMessage: (!focus)? label: label + caret), x+10, y+height-10);
    caretBlink++;
  }
  void textCaret() {
    if (label.length() >= maxlength ||
      caretBlink >= CARET_BLINK_FRAMERATE || !focus || !typing)
      caret = "";
    else
      caret = "_";
    if (caretBlink >= CARET_BLINK_FRAMERATE *2)
      caretBlink = 0;
  }
  String returnWord() {
    return label;
  }
}
