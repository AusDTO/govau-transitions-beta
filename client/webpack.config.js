const webpack = require('webpack')
const path = require('path')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const autoprefixer = require('autoprefixer')

const devBuild = process.env.NODE_ENV !== 'production'
const nodeEnv = devBuild ? 'development' : 'production'

const config = {
  entry: [
    'es5-shim/es5-shim',
    'es5-shim/es5-sham',
    'babel-polyfill',
    'whatwg-fetch',
    './app/startup/App'
  ],

  output: {
    filename: 'webpack-bundle.js',
    path: '../app/assets/webpack'
  },

  resolve: {
    root: [
      path.resolve('./app')
    ],
    extensions: [ '', '.js', '.jsx' ],
    alias: {
      react: path.resolve('./node_modules/react'),
      'react-dom': path.resolve('./node_modules/react-dom')
    },
    modulesDirectories: [ 'node_modules' ]
  },
  module: {
    preLoaders: [
      {
        test: /\.js$/,
        loader: 'eslint',
        include: [
          path.resolve(__dirname, 'app'),
          path.resolve(__dirname, '__tests__')
        ]
      }
    ],
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
        loader: ExtractTextPlugin.extract('css!sass!postcss')
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'url-loader?limit=10000&mimetype=application/font-woff'
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader'
      }
    ]
  },
  sassLoader: {
    outputStyle: devBuild ? 'nested' : 'compressed'
  },
  postcss: [ autoprefixer({ browsers: [ 'last 2 versions', 'ie 9-10' ] }) ],
  plugins: [
    new ExtractTextPlugin('[name].css?[contenthash]', {
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

console.log(`NODE_ENV: ${nodeEnv}`) // eslint-disable-line no-console
if (devBuild) {
  //module.exports.devtool = 'source-map'
} else {
  const ClosureCompilerPlugin = require('webpack-closure-compiler')
  config.plugins.push(
    new webpack.optimize.DedupePlugin(),
    new ClosureCompilerPlugin({
      compiler: {
        language_in: 'ECMASCRIPT6',
        language_out: 'ECMASCRIPT5',
        compilation_level: 'SIMPLE'
      }
    })
  )
}
