#import "@preview/cetz:0.3.2"

#set page(
  paper: "a4",
  margin: (x: 1in, y: 1in),
)
#set par(justify: true)
#set text(
  font: "TeX Gyre Schola",
  size: 12pt,
  lang: "cs",
)
#show math.equation: set text(font: "TeX Gyre Schola Math")
#show raw: set text(size: 11pt)
#let crimson = rgb("#B80F0A")
#let lapis = rgb("#2832C2")
#let emerald = rgb("#028A0F")

== Vzorové zadání lehké úlohy na HTML, CSS a JS

Na obrázku `vzor_stranky.png` (též níže) vidíte finální podobu webové stránky.
Upravte soubory ve složce `vzorove_zadani` tak, aby obsažená stránka co nejlépe
odpovídala té na obrázku. Doporučené kroky jsou v jednotlivých souborech jako
komentáře.

#figure(image("vzor_stranky.png", width: 100%))

#block(
  stroke: 1pt,
  inset: 3mm,
  breakable: true,
  width: 100%,
)[
  === Řešení
  Najdete ve složce `vzorove_reseni`.
]
