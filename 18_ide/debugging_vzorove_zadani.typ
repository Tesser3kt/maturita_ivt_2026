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

== Vzorové zadání lehké úlohy na debugging

Debuggujte zadanou implementaci Merge Sortu v Pythonu (ta bude samozřejmě
uložená jako soubor).

```python
def merge(l1, l2) -> list:
    i, j = 0, 0
    ans = []
    while i < len(l1) and j < len(l2):
        if l1[i] <= l2[j]:
            ans.append(l1[i])
            i += 1
        else:
            ans.append(l2[j])
            j += 1

    while i < len(l1):
        ans.append(l1[i])
        i += 1

    while j < len(l2):
        ans.append(l2[j])
        j += 1

    return ans


def mergesort(data):
    if len(data) <= 1:
        return data
    half = len(data) // 2
    L = mergesort(data[:half])
    R = mergesort(data[half + 1:])

    return merge(L, R)
```

#block(
  stroke: 1pt,
  inset: 3mm,
  breakable: true,
  width: 100%
)[
  === Řešení
  Debugging se v dokumentu pravda blbě ukazuje... Tady si to člověk může
  nakrokovat a zjistí, že ta pravá polovina pole, se kterou se rekursivně volá
  `mergesort`, je moc krátká; chybí tam jeden prvek ze začátku. Ten program
  opravím prostě tak, že předposlední řádek nahradím za
  ```python
  R = mergesort(data[half:])
  ```
]
