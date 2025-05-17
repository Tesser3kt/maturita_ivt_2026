import {
  LineChart,
  Line,
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
      <LineChart data={data}>
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis dataKey="x" type="number" />
        <YAxis dataKey="y" type="number" />
        <Tooltip />
        {/* Line connecting the points with visible dots */}
        <Line
          type="linear"
          dataKey="y"
          stroke="#8884d8"
          strokeWidth={2}
          dot={{ r: 6, stroke: "#8884d8", strokeWidth: 2, fill: "white" }}
          activeDot={{ r: 8 }}
          isAnimationActive={false}
        />
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
      </LineChart>
    </ResponsiveContainer>
  );
}
