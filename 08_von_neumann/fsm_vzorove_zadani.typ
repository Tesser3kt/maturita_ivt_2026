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

== Vzorová zadání lehkých úloh na von Neumannovu architekturu

#enum[
  Přepište danou datovou cestu s řídící FSM do kódu (pseudokódu, Pythonu,
  čehokoliv jiného). Zde řídící FSM
  #list[
    přepne $#raw("a")_#raw("sel")$ i $#raw("b")_#raw("sel")$ z `00` na `01` po
    prvním průchodu;
  ][
    přepne $#raw("a")_#raw("sel")$ i $#raw("b")_#raw("sel")$ z `01` na `10` v
    moment, kdy modrou šipkou prochází proud.
  ]
  #figure(
    image("datapath.png", width: 100%)
  )
  #box(
    stroke: 1pt,
    inset: 3mm
  )[
    === Řešení
    Prve si všimneme, že obvod pro `a` je oddělený od obvodu pro `b`. Obvod pro
    `b` akorát při každém průchodu odečítá od `b` číslo `1` a podmínkou pro
    přepnutí selektorů na `10` je rovnost `b == 0`, takže odečtení proběhne
    tolikrát, kolik je původní hodnota `b`. Přesně tolikrát se původní hodnota v
    `a` vynásobí dvěma. Jelikož původní hodnota v registru `a` je `1`, spočítá
    tento obvod číslo $#raw("2")^#raw("5")$.

    Representace v Pythonu vypadá třeba následovně.
    ```python
    a = 1
    b = 5
    while b != 0:
        a = a * 2
        b = b - 1
    ```
  ]
]
#pagebreak()
#enum(start: 2)[
  Nakreslete datovou cestu s řídící FSM implementující kód v Pythonu, který
  počítá počet cifer čísla.
  ```python
  n = 232811
  x = 0
  while n >= 1:
      n = n / 10
      x = x + 1
  ```
  #box(
    stroke: 1pt,
    inset: 3mm
  )[
    === Řešení
    Stačí nám dva nezávislé obvody a řídící FSM, která přepne na poslední
    hodnotu obou selektorů, když hodnota v registru `n` klesne pod `1`.
    #figure(
      image("datapath_2.png", width: 100%)
    )
  ]
]
