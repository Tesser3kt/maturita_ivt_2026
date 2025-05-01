function ColorSquare() {
  let square = document.getElementById("my-square");
  square.style.backgroundColor = "rgb(150, 100, 50)";
}

let square = document.getElementById("my-square");
square.onclick = ColorSquare;

let squares = Array.from(document.getElementsByClassName("square-2"));
squares.forEach((element) => {
  element.onclick = () => (element.style.backgroundColor = "rgb(150, 100, 50)");
});
