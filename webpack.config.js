const CopyPlugin = require('copy-webpack-plugin');
const HandlebarsPlugin = require('handlebars-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const TerserPlugin = require('terser-webpack-plugin');
const WebpackOnBuildPlugin = require('on-build-webpack');
const fs = require('fs');
const path = require('path');

module.exports = {
  devtool: 'source-map',
  entry: {
    'libs': './src/scss/libs.scss',
    'theme': ['./src/js/theme.js', './src/scss/theme.scss'],
  },
  mode: 'development',
  module: {
    rules: [
      {
        test: /\.(sass|scss)$/,
        include: path.resolve(__dirname, 'src/scss'),
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
          },
          {
            loader: 'css-loader',
            options: {
              url: false,
            },
          },
          {
            loader: 'sass-loader',
          },
        ],
      },
    ],
  },
  optimization: {
    minimizer: [
      new OptimizeCssAssetsPlugin({
        cssProcessorOptions: {
          map: {
            inline: false,
          },
        },
        cssProcessorPluginOptions: {
          preset: [
            'default',
            {
              discardComments: {
                removeAll: true,
              },
            },
          ],
        },
      }),
      new TerserPlugin({
        extractComments: false,
        terserOptions: {
          output: {
            comments: false,
          },
        },
      }),
    ],
  },
  output: {
    filename: './assets/js/[name].bundle.js',
  },
  plugins: [
    new CopyPlugin({
      patterns: [
        {
          from: './src/favicon',
          to: './assets/favicon',
        }
        {
          from: './src/fonts',
          to: './assets/fonts',
        },
        {
          from: './src/img',
          to: './assets/img',
        },
      ],
    }),
    new HandlebarsPlugin({
      entry: path.join(process.cwd(), 'src', 'html', '**', '*.html'),
      output: path.join(process.cwd(), 'dist', '[path]', '[name].html'),
      partials: [path.join(process.cwd(), 'src', 'partials', '**', '*.{html,svg}')],
    }),
    new MiniCssExtractPlugin({
      filename: './assets/css/[name].bundle.css',
    }),
    new WebpackOnBuildPlugin(function () {
      fs.unlinkSync(path.join('./dist/assets/js', 'libs.bundle.js'));
      fs.unlinkSync(path.join('./dist/assets/js', 'libs.bundle.js.map'));
    }),
  ],
};
