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

== Vzorové zadání lehké úlohy na grafiku

Máte dány obrázky `face.jpg`, `hands.jpg`, `lens.jpg`, `light.jpg` a `credits.jpg` ve složce `vzorove_zadani`. Použijte je k co nejvěrnější reprodukci obrázku `vzor.png` v libovolném bitmapovém editoru.

Samozřejmě se neočekává, že stihnete `vzor.png` napodobit. Úloha má za účel ověřit, že umíte do sebe vlévat vrstvy, vhodně je přebarvovat a vkládat text.

#block(
  stroke: 1pt,
  inset: 3mm,
  breakable: true,
  width: 100%,
)[
  === Řešení
  Žádné universální asi není. Ten obrázek se dá vyrobit různě a postup záleží na editoru. Můj "postup" je v `poster.psd`.
]
