# docx-highlighter
  ## How to use
  ![!](https://github.com/sys10m/docx-highlighter/blob/main/dump-Files/GUI_Image.png)
  1. Drag and drop the file to the file listing area in the program.
  2. Type in a keyword to be highlighted in the textbox.
  3. Click generate button and the highlighted file(s) will be generated to the same directory with the original file(s) with the keyword appended at the end of the files name.
## Convert to executable (.exe) <add problem with tkinter and tkinterdnd2 package imports>
### Package
pyinstaller ⇒ can be installed via `pip install pyinstaller`
### Command
  __Windows__
    `python -m PyInstaller --onefile --collect-all tkinter --collect-all tkinterdnd2 --hidden-import tkinter --hidden-import tkinterdnd2 --noconsole --name "Document Highlighter" Document-Highlighter.py`
