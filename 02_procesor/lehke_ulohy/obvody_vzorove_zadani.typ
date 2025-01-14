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
  lang: "cz"
)
#show math.equation: set text(
  font: "TeX Gyre Schola Math",
)
#show raw: set text(
  size: 11pt
)

== Vzorová zadání lehkých úloh na logické obvody

#enum[
  Nakreslete logický obvod se vstupy $i_0$, $i_1$ a $i_2$ implementující výraz
  #align(center)[
    $(i_0 and i_1) or (i_0 and i_2)$.
  ]
  #box(
    stroke: 1pt,
    inset: 3mm
  )[
    === Řešení
    Stačí $i_0$ zapojit do dvou `AND` brán, do jedné navíc vede $i_1$ a do druhé
    $i_2$. Výstupy obou `AND` brán povedou do `OR` brány.
    #figure(
      image("circuit-1.png", width: 60%)
    )
    *P. S.* Nemusíte si pamatovat tvary brán, můžete místo nich kreslit pro mě za
    mě třeba amongus.
  ]
][
  Napište logický výraz odpovídající výstupu daného logického obvodu.
  #figure(
    image("circuit-2.png", width: 50%)
  )
  #box(
    stroke: 1pt,
    inset: 3mm
  )[
    === Řešení
    Stačí procházet obvod zleva doprava (nebo po směru spojů) a stavět logický
    výraz postupně. Z první `NAND` brány vyleze $not(i_0 and i_1)$ a z první
    `AND` brány zase $i_1 and i_2$. Tyhle dva výstupy prolezou `OR` bránou a
    vyleze $not(i_0 and i_1) or (i_1 and i_2)$. Konečně, tohle spolu s $i_1 and
    i_2$ projde poslední `NAND` bránou, takže celkový výraz bude
    #align(center)[
      $not((not(i_0 and i_1) or (i_1 and i_2)) and (i_1 and i_2))$.
    ]
    Můžete to upravit nebo taky nemusíte...
  ]
]
#pagebreak()
#enum(start: 3)[
  Vyhodnoťte výstupy zadaného logického obvodu pro dané vstupy.
  #figure(
    image("circuit-3.png", width: 60%)
  )
  #box(
    stroke: 1pt,
    inset: 3mm
  )[
    === Řešení
    Sledujeme proud, jak prochází bránami zleva doprava. Není špatné si pomoct
    psaním nul a jedniček nad spoje. Třeba takhle:
    #figure(
      image("circuit-3-sol.png", width: 60%)
    )
    Takže horní výstup je `1` a dolní `0`.
  ]
]
