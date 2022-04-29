# docx-highlighter

## Convert to executable (.exe) <add problem with tkinter and tkinterdnd2 package imports>
### Package
pyinstaller ⇒ can be installed via `pip install pyinstaller`\
__Command__\
  `python -m PyInstaller --onefile --collect-all tkinter --collect-all tkinterdnd2 --hidden-import tkinter --hidden-import tkinterdnd2 --noconsole --name "Document Highlighter" Document-Highlighter.py`
