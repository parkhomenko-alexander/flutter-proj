from typing import TYPE_CHECKING, Optional
from .setup import Base
from sqlalchemy import Column, String, Integer, TIMESTAMP, DateTime, Text, ForeignKey, Float
from sqlalchemy.orm import Mapped,  mapped_column, relationship

if TYPE_CHECKING:
    from .auth import RefreshToken

class Word(Base):
    __tablename__ = 'words'

    id: Mapped[int] = mapped_column(primary_key=True)
    word: Mapped[str] = mapped_column(String(80), unique=True)

    def __init__(self, word):
        self.word = word
    def __repr__(self):
        return f'<Word {self.id}, word: {self.word}>'


class WordRelation(Base):
    __tablename__ = 'words_relations'

    id: Mapped[int] = mapped_column(primary_key=True)
    word_id: Mapped[int] = mapped_column(ForeignKey(Word.id))
    translation_id: Mapped[str] = mapped_column(ForeignKey(Word.id))

    word: Mapped[Word] = relationship('Word', 
                                foreign_keys=word_id)
    translation: Mapped[Word] =  relationship('Word', 
                                foreign_keys=translation_id)

    def __init__(self, word_id, translation_id):
        self.word_id = word_id
        self.translation_id = translation_id
    def __repr__(self):
        return f'<Rel {self.id}, word: {self.word.word}, trns: {self.translation.word}>'