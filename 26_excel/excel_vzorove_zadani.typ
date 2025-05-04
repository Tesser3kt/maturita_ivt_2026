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

== Vzorové zadání lehké úlohy na Excel

V souboru `zadani.xls` máte dány tři řádky (náhodně generovaných) dat. V prvním sloupci je jméno závodníka a v dalších dvaceti sloupcích jsou naměřené rychlosti (v km/h) během vybraných dvaceti vteřin závodu. Spočítejte (do vyznačených buněk) průměrnou rychlost každého závodníka a poté (opět do vyznačené buňky) uveďte *jméno* závodníka s nejvyšší průměrnou rychlostí.

Pochopitelně, všechny výpočty musejí záviset na datech v buňkách (včetně jmen závodníků).

#block(
  stroke: 1pt,
  inset: 3mm,
  breakable: true,
  width: 100%,
)[
  === Řešení
  V souboru `reseni.xls`.
]
