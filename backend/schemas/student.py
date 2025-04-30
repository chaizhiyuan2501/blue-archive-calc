from pydantic import BaseModel, Field
from typing import Optional
from datetime import date


class StudentBase(BaseModel):
    name_jp: str
    name_en: Optional[str] = None
    name_zh_CN: Optional[str] = None
    name_zh_TW: Optional[str] = None
    school_id: Optional[int] = None
    gift_id: Optional[int] = None
    role_type: Optional[str] = None
    position: Optional[str] = None
    rarity: Optional[int] = Field(None, ge=1, le=3)
    release_date: Optional[date] = None


class StudentCreate(StudentBase):
    pass


class StudentRead(StudentBase):
    id: int

    class Config:
        from_attributes = True  # Pydantic v2 的新写法
