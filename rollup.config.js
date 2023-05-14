import typescript from "@rollup/plugin-typescript";
import nodeResolve from "@rollup/plugin-node-resolve";

const config = [
  {
    input: "examples/elmPidg.ts",
    output: {
      dir: "dist-pidg",
      format: "cjs",
    },
    plugins: [
      nodeResolve({ resolveOnly: [/^@lingui\/.*$/] }),
      typescript({ tsconfig: "pidg.tsconfig.json" }),
    ],
  },
];

export default config;
