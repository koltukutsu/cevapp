from PIL import Image
from glob import glob

TAKE_FROM_DIR = ""
SAVE_TO_DIR = ""

ORIGINAL_IMG_PATHs = glob(TAKE_FROM_DIR)

ratio_x = 256
ratio_y = 256

for img_path in ORIGINAL_IMG_PATHs:
    image = Image.open(img_path)
    image = image.resize((ratio_x, ratio_y),Image.ANTIALIAS)

    image.save(fp="newimage.png")