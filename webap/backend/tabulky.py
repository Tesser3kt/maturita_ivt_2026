from .setup import db
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import ForeignKey, Integer, String, Table, Column, Date


class Souteze(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    place: Mapped[str] = mapped_column(String(100), unique=False)
    category: Mapped[str] = mapped_column(
        String(100), nullable=False, unique=False)
    points: Mapped[int] = mapped_column(nullable=False, unique=False)
    finals: Mapped[int] = mapped_column(nullable=False, unique=False)
    date = mapped_column(Date, nullable=False, unique=True)
    umisteni: Mapped[int] = mapped_column(unique=False, nullable=False)
    pary: Mapped[int] = mapped_column(unique=False, nullable=False)
    porotci = db.relationship(
        'Porotci', secondary='souteze_porotci', back_populates='souteze')


class Porotci(db.Model):
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str] = mapped_column(
        String(100), unique=True, nullable=False,)
    souteze = db.relationship(
        'Souteze', secondary='souteze_porotci', back_populates='porotci')


class SoutezePorotci(db.Model):
    __tablename__ = "souteze_porotci"
    souteze_id = db.Column(db.Integer, db.ForeignKey(
        "souteze.id"), primary_key=True)
    porotci_id = db.Column(db.Integer, db.ForeignKey(
        "porotci.id"), primary_key=True)
    porotce_index = db.Column(db.Integer, nullable=False)

    # SoutezePorotci.soutez = db.relationship(
    # "Souteze", back_populates="souteze_porotci")
    # SoutezePorotci.porotce = db.relationship(
    # "Porotci", back_populates="souteze_porotci")


class Vysledky(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    soutez_id: Mapped[int] = mapped_column(ForeignKey("souteze.id"))
    samba: Mapped[str] = mapped_column(
        String(100), nullable=True, unique=False)
    chacha: Mapped[str] = mapped_column(
        String(100), nullable=True, unique=False)
    jive: Mapped[str] = mapped_column(String(100), nullable=True, unique=False)
    rumba: Mapped[str] = mapped_column(
        String(100), nullable=True, unique=False)
    paso: Mapped[str] = mapped_column(String(100), nullable=True, unique=False)
    round: Mapped[int] = mapped_column(
        String(100), unique=False, nullable=False)

    def get_dances(self) -> list:
        dances = ['samba', 'chacha', 'jive']
        if self.rumba:
            dances.append('rumba')
        if self.paso:
            dances.append('paso')
        return dances
