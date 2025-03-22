from sqlalchemy.orm import Mapped, mapped_column


class Souteze(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    place: Mapped[str] = mapped_column(unique=False)
    category: Mapped[str] = mapped_column(nullable=False, unique=False)
    p1: Mapped[int] = mapped_column(foreign_key="Porotci.id")


class Porotci(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(unique=True, nullable=False)
