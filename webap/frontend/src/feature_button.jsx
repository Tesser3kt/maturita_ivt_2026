export default function FeatureButton({ label, onChoose, choosen }) {
  //only make the button togle the state and not just change it so there is a
  //way to close a tab. also change its class so it can have some cool color.
  return (
    <button
      className={`${choosen == label ? "active" : "inactive"}`}
      onClick={() => onChoose(label)}
    >
      {label}
    </button>
  );
}
