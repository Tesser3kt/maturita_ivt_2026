import { useState, useEffect } from "react";
import axios from "axios";

import AddVysledky from "./add_vysledky.jsx";

export default function ChooseCompetition() {
  const [options, setOptions] = useState([]);
  const [selected, setSelected] = useState(-1);

  useEffect(() => {
    const allItems = async () => {
      try {
        const items = await axios.get("api/allcomps");
        setOptions(items.data.data);
      } catch (err) {
        console.log(err.message);
      }
    };
    allItems();
  }, []);

  const handleChange = (e) => {
    setSelected(e.target.value);
  };

  return (
    <>
      <h1>Search for comp</h1>
      <form>
        <select
          name="comp"
          list="options"
          value={selected}
          onChange={handleChange}
          placeholder="Jakou chceš soutěž"
          required
        >
          {options.map((item, index) => (
            <option key={index} value={item[1]}>
              {item[0]}
            </option>
          ))}
        </select>
      </form>

      {selected != -1 && <AddVysledky id={selected} />}
    </>
  );
}
