import torch
from ultralytics import YOLO
import easyocr

# 1. Test PyTorch + ROCm
print(f"--- Hardware Check ---")
print(f"ROCm/GPU Available: {torch.cuda.is_available()}")
if torch.cuda.is_available():
    print(f"Using Device: {torch.cuda.get_device_name(0)}")

# 2. Test YOLOv8 GPU Initialization
print(f"\n--- YOLO Check ---")
try:
    model = YOLO('yolov8n.pt')
    model.to('cuda')
    print("YOLO successfully moved to GPU.")
except Exception as e:
    print(f"YOLO GPU Error: {e}")

# 3. Test EasyOCR GPU Initialization
print(f"\n--- EasyOCR Check ---")
try:
    reader = easyocr.Reader(['en'], gpu=True)
    print("EasyOCR successfully initialized with GPU support.")
except Exception as e:
    print(f"EasyOCR GPU Error: {e}")