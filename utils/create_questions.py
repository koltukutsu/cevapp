import uuid
import json
from glob import glob
import random

ALL_QUESTIONS = glob(r"C:\Users\semih\AndroidStudioProjects\cevapp\utils\Questions\*\*")
questionsObject = {
        "untouched": [],
        "shuffled": [],
        "deleted": [],
        "recorded": []
        }

for question_set_path in ALL_QUESTIONS:
    with open(question_set_path, "r") as question_set_file:
        category = question_set_path.split("\\")[-2]
        
        for question in question_set_file:
            level = random.choice(["Beginner", "Intermediate", "Advanced", "Native-Like"])
            
            question_single = {
                    "id": str(uuid.uuid1()),
                    "question": question,
                    "category": category,
                    "level": level
            }
            questionsObject["untouched"].append(question_single)

with open("./assets/data/questions_second.json", "w") as questionsJsonFile:
    json.dump(questionsObject, questionsJsonFile, indent=3)
