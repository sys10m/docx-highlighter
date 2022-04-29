class Screen {
  ArrayList<Widget> widgetList;
  color backgroundColour;
  ArrayList<int[]> rectList;
  Screen(color backgroundColour) {
    this.backgroundColour = backgroundColour;
    widgetList = new ArrayList();
    rectList = new ArrayList();
  }
  
  void addWidget(Widget theWidget){
    this.widgetList.add(theWidget);
  }
  void addRect(int[] coor){
    this.rectList.add(coor);
  }
  
  void draw() {
    background(backgroundColour);
    for (int i = 0; i < rectList.size(); i++){
      noStroke();
      fill(rectList.get(i)[4]);
      rect(rectList.get(i)[0], rectList.get(i)[1], rectList.get(i)[2], rectList.get(i)[3]);
    }
    for (int i = 0; i < widgetList.size(); i++){
      Widget theWidget = (Widget) widgetList.get(i);
      theWidget.draw();
    }
  }

  int getEvent(int x, int y) {
    for (int i = 0; i < widgetList.size(); i++) {
      Widget theWidget = (Widget) widgetList.get(i);
      int event = theWidget.getEvent(x, y);
      if (event != EVENT_NULL)
        return event;
    }
    return EVENT_NULL;
  }
  
}
