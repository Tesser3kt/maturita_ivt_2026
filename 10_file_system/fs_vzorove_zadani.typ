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

      for block in range(1, 8) {
        membl(block, block, red, black)
      }
      for block in range(1, 5) {
        membl(block + 7, block, blue, white)
      }
      for block in range(1, 4) {
        membl(block + 11, block + 7, red, black)
      }
      for block in range(1, 6) {
        membl(block + 14, block, green, black)
      }
      for block in range(1, 3) {
        membl(block + 19, block + 4, blue, white)
      }
      for block in range(1, 3) {
        membl(block + 21, block + 10, red, black)
      }

      // Draw grid
      grid((0, 0), (8, 8), stroke: black.transparentize(50%))
    })
  ]
  #block(
    stroke: 1pt,
    inset: 3mm,
    breakable: true
  )[
    === Řešení

    Při defragmentaci se kousky souborů postupně posouvají doleva a překážející
    soubory se odkládají dočasně do fronty ve volné paměti. Nejprve se tedy
    přesunou první tři slova modrého souboru pryč, aby se tři oddělené kusy
    červeného souboru mohly přesunout doleva.

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
        scope({
          for block in range(1, 8) {
            membl(block, block, red, black)
          }
          membl(11, 4, blue, white)
          for block in range(1, 4) {
            membl(block + 11, block + 7, red, black)
          }
          for block in range(1, 6) {
            membl(block + 14, block, green, black)
          }
          for block in range(1, 3) {
            membl(block + 19, block + 4, blue, white)
          }
          for block in range(1, 3) {
            membl(block + 21, block + 10, red, black)
          }
          for block in range(1, 4) {
            membl(65 - block, block, blue, white)
          }

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
        scope({
          translate(x: 10)
          for block in range(1, 11) {
            membl(block, block, red, black)
          }
          membl(11, 4, blue, white)
          for block in range(1, 6) {
            membl(block + 14, block, green, black)
          }
          for block in range(1, 3) {
            membl(block + 19, block + 4, blue, white)
          }
          for block in range(1, 3) {
            membl(block + 21, block + 10, red, black)
          }
          for block in range(1, 4) {
            membl(65 - block, block, blue, white)
          }

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
      })
    ]

    Nakonec se poslední kus modrého souboru přidá do fronty a dokopíruje se
    doleva zbytek červeného souboru.

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
        scope({
          for block in range(1, 11) {
            membl(block, block, red, black)
          }
          for block in range(1, 6) {
            membl(block + 14, block, green, black)
          }
          for block in range(1, 3) {
            membl(block + 19, block + 4, blue, white)
          }
          for block in range(1, 3) {
            membl(block + 21, block + 10, red, black)
          }
          for block in range(1, 5) {
            membl(65 - block, block, blue, white)
          }

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
        scope({
          translate(x: 10)
          for block in range(1, 13) {
            membl(block, block, red, black)
          }
          for block in range(1, 6) {
            membl(block + 14, block, green, black)
          }
          for block in range(1, 3) {
            membl(block + 19, block + 4, blue, white)
          }
          for block in range(1, 5) {
            membl(65 - block, block, blue, white)
          }

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
      })
    ]
  
    Po defragmentaci červeného souboru se začnou kopírovat kusy z fronty zpátky.
    Kusy souborů, které kopírování překáží, se posouvají do fronty taky.
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
        scope({
          for block in range(1, 13) {
            membl(block, block, red, black)
          }
          for block in range(1, 3) {
            membl(block + 12, block, blue, white)
          }
          for block in range(1, 6) {
            membl(block + 14, block, green, black)
          }
          for block in range(1, 3) {
            membl(block + 19, block + 4, blue, white)
          }
          for block in range(3, 5) {
            membl(65 - block, block, blue, white)
          }

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
        scope({
          translate(x: 10)
          for block in range(1, 13) {
            membl(block, block, red, black)
          }
          for block in range(1, 4) {
            membl(block + 12, block, blue, white)
          }
          for block in range(2, 6) {
            membl(block + 14, block, green, black)
          }
          for block in range(1, 3) {
            membl(block + 19, block + 4, blue, white)
          }
          membl(61, 4, blue, white)
          membl(60, 1, green, black)

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
        scope({
          translate(x: 20)
          for block in range(1, 13) {
            membl(block, block, red, black)
          }
          for block in range(1, 5) {
            membl(block + 12, block, blue, white)
          }
          for block in range(3, 6) {
            membl(block + 14, block, green, black)
          }
          for block in range(1, 3) {
            membl(block + 19, block + 4, blue, white)
          }
          for block in range(1, 3) {
            membl(61 - block, block, green, black)
          }

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
      })
    ]
    Protože ve frontě už jsou jen kusy zeleného souboru, defragmentuje se
    nejprve modrý soubor.
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
        scope({
          for block in range(1, 13) {
            membl(block, block, red, black)
          }
          for block in range(1, 7) {
            membl(block + 12, block, blue, white)
          }
          for block in range(5, 6) {
            membl(block + 14, block, green, black)
          }
          for block in range(1, 5) {
            membl(61 - block, block, green, black)
          }

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
      })
    ]
    Poslední kus zeleného soubory se přesune do fronty a pak se celá fronta
    přesune zpátky, čímž se defragmentuje poslední soubor.
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
        scope({
          for block in range(1, 13) {
            membl(block, block, red, black)
          }
          for block in range(1, 7) {
            membl(block + 12, block, blue, white)
          }
          for block in range(1, 6) {
            membl(61 - block, block, green, black)
          }

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
        scope({
          translate(x: 10)
          for block in range(1, 13) {
            membl(block, block, red, black)
          }
          for block in range(1, 7) {
            membl(block + 12, block, blue, white)
          }
          for block in range(1, 6) {
            membl(18 + block, block, green, black)
          }

          // Draw grid
          grid((0, 0), (8, 8), stroke: black.transparentize(50%))
        })
      })
    ]
  ]
]
#pagebreak()
#enum(start: 2)[
  Uložte daný obrázek do složky `pictures` (s *hlavičkou* obsahující aspoň
  nejnutnější informace) víte-li, že každý jeho pixel je reprezentován trojicí
  `(R, G, B)`, kde `R`, `G`, i `B` jsou čísla od `0` do `255`.

  Současný stav složky `pictures` je dán tabulkou pod obrázkem. Jeden *blok*
  představuje `1` byte paměti.
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
        for block in range(9, 12) {
          pixel(block, blue)
        }
        for block in range(12, 15) {
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
  #align(center)[
    #table(
      align: horizon + center,
      inset: 10pt,
      columns: (12em, 12em),
      stroke: none,
      table.cell(
        colspan: 2,
        align: horizon,
        [složka `pictures`]
      ),
      table.hline(start: 0),
      [název souboru], 
      table.vline(start: 1),
      [bloky],
      table.hline(start: 0),
      [`ja_na_maturite.png`], [`1`, `3`, `7`],
      [`tvoje_mama.gif`], [`5`, `6`, `8`, `14`, `15`, `16`, `17`]
    )
  ]
  #block(
    stroke: 1pt,
    inset: 3mm,
    breakable: true
  )[
    === Řešení
    Stačí si spočítat, kolik má obrázek i s hlavičkou bytů a pak ho zapsat do
    volných bloků.

    V hlavičce souboru obrázku musí být přinejmenším údaj o hloubce barev (kolik
    bytů zabírá jeden pixel) a o šířce a výšce. V tomto případě zabírá pixel
    `3B` a šířka i výška jsou `4`. Na uložení těchto tří údajů mi tedy bohatě
    stačí `3B` (každé číslo zabere jeden blok, míchat údaje v jednom bloku se
    spíš nevyplácí). Celý obrázek má potom dohromady `16 * 3 = 48B`, takže
    potřebujeme `51` bloků na uložení obrázku i s hlavičkou. Výsledná tabulka
    může vypadat třeba takto
    #align(center)[
      #table(
        align: horizon + center,
        inset: 10pt,
        columns: (12em, 20em),
        stroke: none,
        table.cell(
          colspan: 2,
          align: horizon,
          [složka `pictures`]
        ),
        table.hline(start: 0),
        [název souboru], 
        table.vline(start: 1),
        [bloky],
        table.hline(start: 0),
        [`ja_na_maturite.png`], [`1`, `3`, `7`],
        [`tvoje_mama.gif`], [`5`, `6`, `8`, `14`, `15`, `16`, `17`],
        [`dany_obrazek.png`], [`2`, `4`, `9`, `10`, `11`, `12`, `13`, `18`,
        `19`, ..., `61`]
      )
    ]
  ]
]
