from pydantic import BaseModel, Field


class SchoolBase(BaseModel):
    name: str


class SchoolCreate(SchoolBase):
    pass


class SchoolRead(SchoolBase):
    id: int

    class Config:
        from_attributes = True
