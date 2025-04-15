import { useState, useEffect } from "react";
import axios from "axios";

export default function AddVysledky() {
  const [options, setOptions] = useState([]);
  const [selected, setSelected] = useState(-1);

  useEffect(() => {
    const allItems = async () => {
      try {
        const items = await axios.get("api/allcomps");
        setOptions(items.data);
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
      <h1>Search for User</h1>
      <form>
        <input
          type="text"
          name="comp"
          list="options"
          value={selected}
          onChange={handleChange}
          placeholder="Jakou chceš soutěž"
          autoComplete="off"
          required
        />
        <datalist id="options">
          {options.map((item, index) => (
            <option key={index} value={item.id} />
          ))}
        </datalist>
      </form>

      {selected != -1 && <p>koule pero</p>}
    </>
  );
}
