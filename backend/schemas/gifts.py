from pydantic import BaseModel, Field
from typing import Optional

class GiftBase(BaseModel):
    name: str
    icon: Optional[str] = None
    description: Optional[str] = None
    gift_type: Optional[str] = None
    affection_increase: int
    obtain_method: Optional[str] = None


class GiftCreate(GiftBase):
    pass


class GiftRead(GiftBase):
    id: int

    class Config:
        from_attributes = True
