const path = require('path');

module.exports = {
  entry: {
    application: './app/javascript/packs/application.js',
    calculate_price: './app/javascript/packs/calculate_price.js',
    chat_room: './app/javascript/packs/chat_room.js',
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, 'public/packs')
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader', // No additional options needed
        },
      },
    ],
  },
};
