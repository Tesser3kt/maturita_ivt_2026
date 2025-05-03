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

== Vzorové zadání lehké úlohy na React

Upravte Reactovou aplikaci ve složce `vzorove_zadani/src/App.jsx` tak, aby pozadí `div`u třídy `content` změnilo barvu na další v poli `colorCodes` při kliknutí na tlačítko třídy `change-color`. Po poslední barvě následuje zase první. Obsahem nadpisu třídy `color-name` je pak jméno odpovídající barvy z~pole `colorNames`.

Více v komentářích v souboru `App.jsx` a na obrázku `zadani_obrazek.png` níže.

#figure(image("zadani_obrazek.png", width: 90%))

#block(
  stroke: 1pt,
  inset: 3mm,
  breakable: true,
  width: 100%,
)[
  === Řešení
  Najdete ve složce `vzorove_reseni`.
]
