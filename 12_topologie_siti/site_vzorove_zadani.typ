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

== Vzorové zadání lehké úlohy na topologii

Navrhněte topologii počítačové sítě tak, aby
- bylo přidávání nových počítačů do sítě triviální;
- byla rozdělena na servery a klienty;
- měla minimálně tři servery a žádný SPF;
- zprávy mezi klientem a libovolným serverem procházely přes nejvýše jeden další
  server a přes žádného klienta;
- zprávy mezi klienty procházely přes nejvýše dva servery a žádného klienta.

#block(
  stroke: 1pt,
  inset: 3mm,
  breakable: true,
  width: 100%
)[
  === Řešení
  Jeden možný způsob, jak navrhnout tuto síť, je umístit tři servery s
  (obousměrnou) `RING` topologií 'doprostřed' sítě a každého klienta spojit s
  aspoň dvěma servery. Takto, i když jeden server přestane fungovat, síť se
  nezhroutí, a podmínky na efektivitu komunikace budou též splněny. Ve výsledku
  vznikne jakási varianta `TREE` topologie. Příklad na obrázku (`S` jsou servery
  a `C` klienti).
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *

      let client(angle, distance) = {
        circle((angle, distance), radius: .35, fill: lapis.lighten(70%))
        content((angle, distance), [`C`])
      }
      
      for (server_index, angle) in ((1, 90deg), (2, 210deg), (3, 330deg)) {
        circle((angle, 1.5), radius: .5, fill: emerald.lighten(70%),
        name: "S" + str(server_index))
        content((angle, 1.5), [`S`])
      }
      on-layer(-1, {
        circle((0, 0), radius: 1.6)
        circle((0, 0), radius: 1.4)
      })

      // S1 primary clients
      for (angle, distance) in (
        (70deg, 3.5), (90deg, 4), (120deg, 3)
      ) {
        client(angle, distance)
        on-layer(-1, {
          line((angle, distance), "S1", stroke: (thickness: .75pt, dash:
          "dashed"))
        })
      }

      // S2 primary clients
      for (angle, distance) in (
        (180deg, 4), (220deg, 3), (260deg, 3)
      ) {
        client(angle, distance)
        on-layer(-1, {
          line((angle, distance), "S2", stroke: (thickness: .75pt, dash:
          "dashed"))
        })
      }

      // S3 primary clients
      for (angle, distance) in (
        (300deg, 3.7), (335deg, 2.8), (350deg, 3)
      ) {
        client(angle, distance)
        on-layer(-1, {
          line((angle, distance), "S3", stroke: (thickness: .75pt, dash:
          "dashed"))
        })
      }

      // More connections
      on-layer(-1, {
        line((180deg, 4), "S1", stroke: (thickness: .75pt, dash:
        "dashed"))
        line((260deg, 3), "S1", stroke: (thickness: .75pt, dash:
        "dashed"))
        line((300deg, 3.7), "S1", stroke: (thickness: .75pt, dash:
        "dashed"))
        line((335deg, 2.8), "S1", stroke: (thickness: .75pt, dash:
        "dashed"))

        line((120deg, 3), "S2", stroke: (thickness: .75pt, dash:
        "dashed"))
        line((90deg, 4), "S2", stroke: (thickness: .75pt, dash:
        "dashed"))
        line((350deg, 3), "S2", stroke: (thickness: .75pt, dash:
        "dashed"))

        line((70deg, 3.5), "S3", stroke: (thickness: .75pt, dash:
        "dashed"))
        line((220deg, 3), "S3", stroke: (thickness: .75pt, dash:
        "dashed"))
      })
    })
  ]
]
