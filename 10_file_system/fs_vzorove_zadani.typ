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

== Vzorová zadání lehkých úloh na souborové systémy 

#enum[
  Defragmentujte zadaný blok paměti (barvy representují různé soubory a jejich
  kusy jsou číslované).
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *

      let membl(block, number, bg_color, fg_color) = {
        let x = calc.rem(block - 1, 8)
        let y = 7 - calc.trunc((block - 1) / 8)
        rect((x, y), (x + 1, y + 1), fill: bg_color, stroke: 0pt)
        content((x + 0.5, y + 0.5), anchor: "center",
        [#text(fg_color)[#raw(str(number))]])
      }
      scale(x: 50%, y: 50%)

      // Draw memory blocks
      // Red file

      for block in range(1, 8) {
        membl(block, block, red, black)
      }

      // Draw grid
      grid((0, 0), (8, 8), stroke: black.transparentize(50%))
    })
  ]
  #box(
    stroke: 1pt,
    inset: 3mm
  )[

  ]
]
