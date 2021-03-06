# docx-highlighter

## Installation
  
  Download [executable file](https://github.com/sys10m/docx-highlighter/blob/main/Document%20Highlighter.exe) and you are ready to go.
  
## How to use
  
  ![!](https://github.com/sys10m/docx-highlighter/blob/main/dump-Files/GUI_Image.png)
  1. Drag and drop the file to the file listing area in the program.
  2. Type in a keyword to be highlighted in the textbox.
  3. Click generate button and the highlighted file(s) will be generated to the same directory with the original file(s) with the keyword appended at the end of the files name.
  
## Implementation
  
### Generating a new highlighted file
  
[code](https://github.com/sys10m/docx-highlighter/blob/main/dump-Files/genHighlightedFile.py)\
 The program goes through all the runs, a unit of text in the document, and append the run with the same attributes into the new document if there is no keyword inside. If there is the keyword inside the run, the program will split it into three part (before the keyword, the keyword, after the keyword), append each of them with the same attriburtes with the original run into the new document, and change the highlight of the keyword run to be yellow.
    
### Convert to executable (.exe) <add problem with tkinter and tkinterdnd2 package imports>
  
#### Package
  
pyinstaller ⇒ can be installed via `pip install pyinstaller`
  
#### Command
      
__Windows__\
`python -m PyInstaller --onefile --collect-all tkinter --collect-all tkinterdnd2 --hidden-import tkinter --hidden-import tkinterdnd2 --noconsole --name "Document Highlighter" Document-Highlighter.py`
