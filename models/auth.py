import datetime
from .setup import Base

from sqlalchemy import TIMESTAMP, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from .models import User

class RefreshToken(Base):
    __tablename__ = 'refresh_token'

    id: Mapped[int] = mapped_column(primary_key=True)
    token: Mapped[str] = mapped_column(nullable=False)
    user_id: Mapped[int] = mapped_column(ForeignKey('users.id'), nullable=False, unique=True)
    created: Mapped[datetime.datetime] = mapped_column(TIMESTAMP, default=datetime.datetime.utcnow)

    user: Mapped['User'] = relationship('User',
                                    back_populates='refresh_token',
                                    foreign_keys=[user_id])

    def __repr__(self):
        return f'<Token = {self.token}, created = {self.created}, user_id = {self.user_id}>'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            

        