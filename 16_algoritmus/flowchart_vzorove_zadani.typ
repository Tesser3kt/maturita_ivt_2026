#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond

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

== Vzorová zadání lehkých úloh na flowcharty

#enum[
  Nakreslete flowchart následujícího programu na výpočet součtu sudých cifer
  čísla.
  ```python
  n = 3556
  s = 0

  while n > 0:
      d = n % 10
      if d % 2 == 0:
          s += d
      n = n // 10
  ```

  #block(
    stroke: 1pt,
    inset: 3mm,
    breakable: true,
    width: 100%
  )[
    === Řešení

    #align(center)[
      #diagram(
        node-stroke: 1pt,
        node((0, 0), [start], corner-radius: 2pt, inset: 3mm, fill:
        crimson.transparentize(80%)),
        edge("-|>"),
        node((0, 1), align(left)[
          `n = 3556`\
          `s = 0`
        ], inset: 3mm, fill: lapis.transparentize(80%)),
        edge("-|>"),
        node((0, 2), [`n > 0`], inset: 3mm, shape: diamond, fill:
        emerald.transparentize(80%)),
        edge("-|>", [ano], label-pos: .4, label-side: left),
        edge("l,d", "-|>", [ne], label-pos: .2),
        node((0, 3), [`d = n % 10`], inset: 3mm, fill:
        lapis.transparentize(80%)),
        edge("d","-|>"),
        node((-1, 3), [konec], corner-radius: 2pt, inset: 3mm, fill:
        crimson.transparentize(80%)),
        node((0, 4), [`d % 2 == 0`], inset: 3mm, shape: diamond, fill:
        emerald.transparentize(80%)),
        edge("-|>", [ano], label-pos: .4, label-side: left),
        edge("rr", "-|>", [ne], label-pos: .4, label-side: left),
        node((0, 5), [`s = s + d`], inset: 3mm, fill:
        lapis.transparentize(80%)),
        edge("rr,u", "-|>"),
        node((2, 4), [`n = n // 10`], inset: 3mm,
        fill:lapis.transparentize(80%)),
        edge("uu,ll", "-|>")
      )
    ]
  ]
]
#pagebreak()
#enum(start: 2)[
  Přepište následující flowchart insertion sortu do libovolného programovacího
  jazyka.
  #align(center)[
    #diagram(
      node-stroke: 1pt,
      node((0, 0), [start], corner-radius: 2pt, inset: 3mm, fill:
      crimson.transparentize(80%)),
      edge("-|>"),
      node((0, 1), align(left)[
        `i = 1`\
        `n = 7  # delka pole`\
        `arr = [4, 1, 2, 3, 5, 3, 1]`
      ], inset: 3mm, fill: lapis.transparentize(80%)),
      edge("-|>"),
      node((0, 2), [`i < n`], inset: 3mm, shape: diamond, fill:
      emerald.transparentize(80%)),
      edge("d", "-|>", [ano], label-pos: .4, label-side: left),
      edge("l,d", "-|>", [ne], label-pos: .2),
      node((-1, 3), [konec], corner-radius: 2pt, inset: 3mm, fill:
      crimson.transparentize(80%)),
      node((0, 3), align(left)[
        `k = arr[i]`\
        `j = i - 1`
      ], inset: 3mm, fill:
      lapis.transparentize(80%)),
      edge("-|>"),
      node((0, 4), align(center)[
        `(0 <= j)`\
        `and`\
        `(k < arr[j]))`
      ], inset: 4mm, shape: diamond,
      fill: emerald.transparentize(80%)),
      edge("-|>", [ano], label-pos: .4, label-side: left),
      edge("r", "-|>", [ne], label-pos: .4),
      node((0, 5), align(left)[
        `arr[j + 1] = arr[j]`\
        `j = j - 1`
      ], inset: 3mm, fill: lapis.transparentize(80%)),
      edge("l,u,r", "-|>"),
      node((1, 4), align(left)[
        `arr[j + 1] = k`
      ], inset: 3mm, fill: lapis.transparentize(80%)),
      edge("-|>"),
      node((1, 3), align(left)[
        `i = i + 1`
      ], inset: 3mm, fill: lapis.transparentize(80%)),
      edge("u,l", "-|>")
    )
  ]
  #block(
    stroke: 1pt,
    inset: 3mm,
    breakable: true,
    width: 100%
  )[
    === Řešení
    
    U přepisu 'doslovných' flowchartů jde jen o to nahradit podmínky, do kterých
    se vrací, cykly a kód správně zanořit. V Pythonu by tento flowchart vypadal
    takto:
    ```python
    i = 1
    n = 7
    arr = [4, 1, 2, 3, 5, 3, 1]

    while i < n:
        k = arr[i]
        j = i - 1

        while (0 <= j) and (k < arr[j]):
            arr[j + 1] = arr[j]
            j = j - 1

        arr[j + 1] = k
        i = i + 1
    ```
    Můžete si všimnout, že vnější `while` cyklus bylo lze napsat jako `for`
    cyklus.
  ]
]
