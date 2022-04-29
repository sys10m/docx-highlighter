import pythainlp
import tika
tika.initVM()
from tika import parser

parsed = parser.from_file(r"filePath1") # replace filePath1 with pdf file path
txtFileContent = open(r"filePath", "w", encoding = 'utf-8') # replace filePath with the directory that wish the file to be

for i in parsed["content"]:
    txtFileContent.write(i)
txtFileContent.close()

with open(r"filePath", "r", encoding = 'utf-8') as txtFileContent:
    lines = txtFileContent.readlines()

listOfReg = []
for i in range(len(lines)):
    lines[i] = pythainlp.word_tokenize(lines[i], keep_whitespace = True)
    for j in range(len(lines[i])):
        if (lines[i][j] == "ข้อ"):
            listOfReg.append(i)
            print(lines[i])
            print("<end>")

with open(r"filePath2", "w", encoding = 'utf-8') as regs: # replace filePath2 with the directory that wish the file to be
    for i in range(len(listOfReg)):
        for j in range(len(lines[listOfReg[i]])):
            regs.write(lines[listOfReg[i]][j])