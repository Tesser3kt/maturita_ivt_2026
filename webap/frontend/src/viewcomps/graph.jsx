import {
  ScatterChart,
  Scatter,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  ReferenceLine,
} from "recharts";

export default function Graph({ data, special }) {
  return (
    <ResponsiveContainer width="100%" height={400}>
      <ScatterChart>
        <CartesianGrid />

        <XAxis type="number" dataKey="x" name="X Axis" />
        <YAxis type="number" dataKey="y" name="Y Axis" />
        <Tooltip cursor={{ strokeDasharray: "3 3" }} />

        <Scatter name="Data Points" data={data} fill="blue" />

        {special &&
          special.map((object, index) => (
            <ReferenceLine
              x={object.x}
              stroke="red"
              label={object.label}
              strokeDasharray="3 3"
              key={index}
            />
          ))}
      </ScatterChart>
    </ResponsiveContainer>
  );
}
