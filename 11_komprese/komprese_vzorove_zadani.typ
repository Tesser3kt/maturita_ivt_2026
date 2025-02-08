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

== Vzorová zadání lehkých úloh na kompresi

#enum[
  Zkomprimujte následující audio (dané jako posloupnost amplitud) použitím
  *run-length* komprese. Porovnejte velikost komprimovaného audia s původní,
  když na uložení jedné amplitudy potřebuji `2B` a délka audia nepřesáhne `1000`
  amplitud.
  #cetz.canvas({
    import cetz.draw: *
    
    // Draw amplitudes
    let amplitudes = (2, 2, 2, 4, 5, 5, 7, 7, 7, 1, 1, 2, 3)
    for (index, amplitude) in amplitudes.enumerate() {
      rect((index, 0), (index + 1, amplitude), stroke: 0.5pt +
      black.transparentize(50%), fill: crimson)
      content(
        (index + .5, -.3),
        [#text(crimson)[#raw(str(amplitude))]]
      )
    }

    // Draw axes
    line((-1, 0), (14, 0), mark: (end: ">"), name: "x")
    line((0, -1), (0, 8), mark: (end: ">"), name: "y")

    // Label axes
    content(
      ("x.start", 50%, "x.end"),
      padding: .8,
      anchor: "north",
      [amplitudy]
    )
  })
  #block(
    stroke: 1pt,
    inset: 3mm,
    breakable: true
  )[
    === Řešení
    Run-length komprese nahradí každou posloupnost amplitud dvojicí čísel (délka
    posloupnosti, amplituda). V tomto případě nahradíme první trojici dvojek za
    dvojici (3, 2), následující čtyřku za (1, 4), další dvě pětky za (2, 5) atd.
    Výsledná posloupnost bude
    #align(center)[
      `3 2 1 4 2 5 3 7 2 1 1 2 1 3`
    ]
    Protože na uložení amplitudy potřebuji `2B` a na uložení délky posloupnosti
    rovněž `2B` ($2^16 = 65536 > 1000$), bude mít komprimované audio velikost
    `14 * 2 = 28B`. Původní audio sestávalo z 13 amplitud, takže mělo `13 * 2 = `
    `26B`. V tomto případě byla run-length komprese tak akorát na škodu. RIP.
  ]
]
#pagebreak()
#enum(start: 2)[
  Zkomprimujte následující obrázek použitím (Huffmanova) stromu priorit. Stačí
  výsledná posloupnost representující obrázek, samotný strom kódovat nemusíte.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *

      let pixel(block, bg_color) = {
        let x = calc.rem(block - 1, 4)
        let y = 3 - calc.trunc((block - 1) / 4)
        rect((x, y), (x + 1, y + 1), fill: bg_color, stroke: 0pt)
      }

      // Draw memory blocks
      scope({
        for block in range(1, 8) {
          pixel(block, red)
        }
        pixel(8, green)
        for block in range(9, 13) {
          pixel(block, blue)
        }
        for block in range(13, 15) {
          pixel(block, red)
        }
        for block in range(15, 17) {
          pixel(block, green)
        }

        // Draw grid
        grid((0, 0), (4, 4), stroke: black.transparentize(50%))
      })
    })
  ]
  #block(
    stroke: 1pt,
    inset: 3mm,
    breakable: true,
    width: 100%
  )[
    === Řešení
    Nejprve si obrázek překreslíme jako posloupnost.
    #show raw: set text(
      size: 8pt
    )
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        for x in range(7) {
          rect((x/2, 0), (x/2 + .5, .5), fill: red, stroke: .5pt)
          content((x/2 + .25, -.2), [#text(red)[#raw("R")]])
        }
        rect((7/2, 0), (4,.5), fill: green, stroke: .5pt)
        content((7/2 + .25, -.2), [#text(green)[#raw("G")]])
        for x in range(8, 12) {
          rect((x/2, 0), (x/2 + .5, .5), fill: blue, stroke: .5pt)
          content((x/2 + .25, -.2), [#text(blue)[#raw("B")]])
        }
        for x in range(12, 14) {
          rect((x/2, 0), (x/2 + .5, .5), fill: red, stroke: .5pt)
          content((x/2 + .25, -.2), [#text(red)[#raw("R")]])
        }
        for x in range(14, 16) {
          rect((x/2, 0), (x/2 + .5, .5), fill: green, stroke: .5pt)
          content((x/2 + .25, -.2), [#text(green)[#raw("G")]])
        }
      })
    ]
    #show raw: set text(
      size: 11pt
    )
    Teď ji rozdělíme na dvojice; různé typy dvojic budou: `RR`, `RG`, `BB` a
    `GG`. Dvojice `RR` je v obrázku 4x, `BB` 2x a zbylé dvě dvojice jen jednou.

    Začneme stavět Huffmanův strom. Ze začátku máme čtyři uzly:
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        let freqs = (1, 1, 2, 4)
        for (index, freq) in freqs.enumerate() {
          circle((2 * index, 0), radius: .5, fill: black.transparentize(90%))
          content((2 * index, 0), [#raw(str(freq))])
        }
        content((0, -.8), [#text(red)[#raw("R")]#text(green)[#raw("G")]])
        content((2, -.8), [#text(green)[#raw("GG")]])
        content((4, -.8), [#text(blue)[#raw("BB")]])
        content((6, -.8), [#text(red)[#raw("RR")]])
      })
    ]
    Uzly s nejnižšími četnostmi spojíme ve strom s kořenem držícím součet
    četností těchto uzlů.
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        set-style(content: (frame: "rect", padding: (.1, .1), stroke: none))
        circle((1, 0), radius: .5, fill: black.transparentize(90%), name: "root")
        content((1, 0), [`2`])
        let freqs = (2, 4)
        for (index, freq) in freqs.enumerate() {
          circle((2 * (index + 2), 0), radius: .5, fill: black.transparentize(90%))
          content((2 * (index + 2), 0), [#raw(str(freq))])
        }
        content((0, -1.6), [#text(red)[#raw("R")]#text(green)[#raw("G")]],
        name: "RG")
        content((2, -1.6), [#text(green)[#raw("GG")]], name: "GG")
        content((4, -.8), [#text(blue)[#raw("BB")]])
        content((6, -.8), [#text(red)[#raw("RR")]])

        line("root.south-west", "RG.north")
        line("root.south-east", "GG.north")
      })
    ]
    Takhle postupujeme dál, dokud nemáme jediný strom.
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        set-style(content: (frame: "rect", padding: (.1, .1), stroke: none))
        circle((1, -1.6), radius: .5, fill: black.transparentize(90%), name:
        "left")
        content((1, -1.6), [`2`])

        circle((2.5, 0), radius: .5, fill: black.transparentize(90%), name:
        "root")
        content((2.5, 0), [`4`])

        circle((6, 0), radius: .5, fill: black.transparentize(90%))
        content((6, 0), [`4`])

        content((0, -3.2), [#text(red)[#raw("R")]#text(green)[#raw("G")]],
        name: "RG")
        content((2, -3.2), [#text(green)[#raw("GG")]], name: "GG")
        content((4, -1.6), [#text(blue)[#raw("BB")]], name: "BB")
        content((6, -.8), [#text(red)[#raw("RR")]], name: "RR")

        line("left.south-west", "RG.north")
        line("left.south-east", "GG.north")
        line("root.south-west", "left.north")
        line("root.south-east", "BB.north")
      })
    ]
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        set-style(content: (frame: "rect", padding: (.1, .1), stroke: none))
        circle((1, -1.6), radius: .5, fill: black.transparentize(90%), name:
        "left")
        content((1, -1.6), [`2`])

        circle((2.5, 0), radius: .5, fill: black.transparentize(90%), name:
        "root")
        content((2.5, 0), [`4`])

        circle((4.25, 1.6), radius: .5, fill: black.transparentize(90%), name:
        "moreroot")
        content((4.25, 1.6), [`8`])

        content((0, -3.2), [#text(red)[#raw("R")]#text(green)[#raw("G")]],
        name: "RG")
        content((2, -3.2), [#text(green)[#raw("GG")]], name: "GG")
        content((4, -1.6), [#text(blue)[#raw("BB")]], name: "BB")
        content((6, 0), [#text(red)[#raw("RR")]], name: "RR")

        line("left.south-west", "RG.north")
        line("left.south-east", "GG.north")
        line("root.south-west", "left.north")
        line("root.south-east", "BB.north")
        line("moreroot.south-west", "root.north")
        line("moreroot.south-east", "RR.north")
      })
    ]
    Když značíme "pohyb" doleva jako `0` a doprava jako `1`, dostaneme
    následující kódování.
    #align(center)[
      #table(
        columns: (auto, auto),
        align: horizon,
        stroke: none,
        table.header(
          [*blok*], 
          [*kód*]
        ),
        table.hline(),
        [#text(red)[`RR`]], table.vline(start: 1), [`1`],
        [#text(blue)[`BB`]], [`01`],
        [#text(green)[`GG`]], [`001`],
        [#text(red)[`R`]#text(green)[`G`]], [`000`]
      )
    ]
    Konečná posloupnost je tedy
    #align(center)[
      `1` `1` `1` `000` `01` `01` `1` `001`.
    ]
  ]
]

