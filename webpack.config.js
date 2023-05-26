const path = require("path");
const { CleanWebpackPlugin } = require("clean-webpack-plugin");

module.exports = {
  mode: "development",
  entry: {
	  portfolioList: "./WebContent/v2/js/portfolio/index.jsx",
	  portfolioDetail : "./WebContent/v2/js/portfolio/portfolioDetail.jsx",
  },
  output:{
	  path : path.resolve(__dirname, 'WebContent/v2/js/portfolio/dist'),
	  filename: '[name].js'
  },
  devtool: "inline-source-map",
  devServer: {
    contentBase: "./WebContent/v2",
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
      {
          test: /\.css$/,
          loader: 'css-loader'
        }
    ],
  },
  plugins: [new CleanWebpackPlugin()],
};
