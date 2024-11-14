from ninja import Schema
from typing import Optional

class UserSchema(Schema):
    id: int
    username: str
    email: Optional[str] = None  # Mark as optional in case it’s not always available
    first_name: Optional[str] = None
    last_name: Optional[str] = None