const webpack = require('webpack')
const path = require('path')
const ExtractTextPlugin = require('extract-text-webpack-plugin')

const devBuild = process.env.NODE_ENV !== 'production'
const nodeEnv = devBuild ? 'development' : 'production'

const config = {
  entry: [
    'es5-shim/es5-shim',
    'es5-shim/es5-sham',
    'babel-polyfill',
    './app/bundles/transition/startup/App'
  ],

  output: {
    filename: 'webpack-bundle.js',
    path: '../app/assets/webpack'
  },

  resolve: {
    root: [
      path.resolve('./app')
    ],
    extensions: ['', '.js', '.jsx'],
    alias: {
      react: path.resolve('./node_modules/react'),
      'react-dom': path.resolve('./node_modules/react-dom')
    },
    modulesDirectories: ['node_modules']
  },
  module: {
    loaders: [
      {
        test: require.resolve('react'),
        loader: 'imports?shim=es5-shim/es5-shim&sham=es5-shim/es5-sham'
      },
      {
        test: /\.jsx?$/, loader: 'babel-loader',
        exclude: /node_modules/
      },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract('css!sass')
      },
      {
        test: /\.jpe?g$|\.gif$|\.png$|\.svg$/i,
        loader: 'file-loader?name=/img/[name].[ext]'
      }
    ]
  },
  sassLoader: {
    outputStyle: devBuild ? 'nested' : 'compressed'
  },
  plugins: [
    new ExtractTextPlugin('[name].css?[hash]-[chunkhash]-[contenthash]', {
      disable: false,
      allChunks: true
    }),
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv)
      }
    })
  ]
}

module.exports = config

if (devBuild) {
  console.log('Webpack dev build for Rails') // eslint-disable-line no-console
  module.exports.devtool = 'eval-source-map'
} else {
  config.plugins.push(
    new webpack.optimize.DedupePlugin()
  )
  console.log('Webpack production build for Rails') // eslint-disable-line no-console
}
