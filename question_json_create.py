import uuid
import json
from questions import questionsList

questionsObject = {
        "untouched": [],
        "shuffled": [],
        "deleted": [],
        "recorded": []
        }

for item in questionsList:
    question = {"id":str(uuid.uuid1()), "question": item}
    questionsObject["untouched"].append(question)

with open("./assets/data/questions.json", "w") as questionsJsonFile:
    json.dump(questionsObject, questionsJsonFile)
