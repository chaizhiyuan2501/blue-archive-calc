from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# ✅ CORS 设置放在这里
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],  # 或 ["*"] 允许所有来源
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 🚀 路由定义
@app.get("/")
def read_root():
    return {"message": "Hello OCR"}
