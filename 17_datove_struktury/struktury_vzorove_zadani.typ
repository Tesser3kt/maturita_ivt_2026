#import "@preview/cetz:0.3.2"

#set page(
  paper: "a4",
  margin: (x: 1in, y: 1in)
)
#set par(
  justify: true
)
#set text(
  font: "TeX Gyre Schola",
  size: 12pt,
  lang: "cs"
)
#show math.equation: set text(
  font: "TeX Gyre Schola Math",
)
#show raw: set text(
  size: 11pt
)
#let crimson = rgb("#B80F0A")
#let lapis = rgb("#2832C2")
#let emerald = rgb("#028A0F")

== Vzorová zadání lehkých úloh na datové struktury

#enum[
  V Pythonu máte třídu `Node` representující uzel spojového seznamu a `List`
  representující tento seznam. Doplňte třídu `List` o metodu (ve skutečném
  zadání jí bude jedna z následujících)
  - `append`,
  - `prepend`
  - `insert`,
  - `delete`,
  - `pop`,
  která
  - přidá uzel s danou hodnotou na konec seznamu,
  - přidá uzel s danou hodnotou na začátek seznamu,
  - vloží uzel s danou hodnotou na daný index v seznamu,
  - smaže uzel s daným indexem ze seznamu,
  - smaže uzel z konce seznamu.
  #block(
    stroke: 1pt,
    inset: 3mm,
    breakable: true,
    width: 100%
  )[
    === Řešení
    Všechny metody najdete naprogramované v `seznam.py`.
  ]
]
#pagebreak()
#enum(start: 2)[
  Naprogramujte funkci `hash`, která daný (ve skutečném zadání jím bude jeden
  z~následujících)
  - `integer`,
  - `string`,
  převede na index v poli o dané velikosti. Snažte se, aby vaše hashovací funkce
  byla co nejvíce prostá (tedy vzniklé hashe budou co nejpravidelněji
  rozprostřeny mezi přijatelné indexy).
  #block(
    stroke: 1pt,
    inset: 3mm,
    breakable: true,
    width: 100%
  )[
    === Řešení
    Pro typ `string` najdete jedno možné (ale na potítko zbytečně komplikované)
    řešení v `hash_table.py`. Pro `integer` je tato úloha samozřejmě výrazně
    jednodušší (stačí třeba zbytek po dělení).
  ]
]
