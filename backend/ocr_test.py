import easyocr
from PIL import Image
import matplotlib.pyplot as plt

# 🔍 1. 加载 OCR 识别器（支持日语 + 英语）
reader = easyocr.Reader(['ja', 'en'])

# 📷 2. 加载图像（替换为你自己的图片路径）
image_path = "example.png"  # ← 你的图片文件路径
image = Image.open(image_path)

# 🧠 3. 执行 OCR 识别
results = reader.readtext(image_path)

# 📋 4. 输出结果
print("\n=== 识别结果 ===")
for (bbox, text, confidence) in results:
    print(f"[{confidence:.2f}] {text}")

# 📊 5. 可视化标注结果（可选）
def draw_boxes(image, results):
    import cv2
    import numpy as np
    img_np = np.array(image.convert("RGB"))
    for (bbox, text, prob) in results:
        top_left = tuple(map(int, bbox[0]))
        bottom_right = tuple(map(int, bbox[2]))
        img_np = cv2.rectangle(img_np, top_left, bottom_right, (0, 255, 0), 2)
        img_np = cv2.putText(img_np, text, top_left, cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 0, 0), 1)
    return img_np

# 显示图像 + 识别结果框
annotated_image = draw_boxes(image, results)
plt.imshow(annotated_image)
plt.axis("off")
plt.show()
