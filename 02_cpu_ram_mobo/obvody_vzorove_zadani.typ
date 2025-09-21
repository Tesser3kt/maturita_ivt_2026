#set page(
  paper: "a4",
  margin: (x: 1in, y: 1in),
)
#set par(
  justify: true,
)
#set text(
  size: 12pt,
  lang: "cz",
  font: "TeX Gyre Schola",
)
#show math.equation: set text(
  font: "TeX Gyre Schola Math",
)
#show raw: set text(
  size: 11pt,
)

== Vzorová zadání lehkých úloh na logické obvody


Vyhodnoťte výstupy zadaného logického obvodu pro dané vstupy.
#figure(
  image("circuit-3.png", width: 60%),
)
#box(
  stroke: 1pt,
  inset: 3mm,
)[
  === Řešení
  Sledujeme proud, jak prochází bránami zleva doprava. Není špatné si pomoct
  psaním nul a jedniček nad spoje. Třeba takhle:
  #figure(
    image("circuit-3-sol.png", width: 60%),
  )
  Takže horní výstup je `1` a dolní `0`.
]
