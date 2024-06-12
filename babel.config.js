// babel.config.js
const babel = require('@babel/core');

module.exports = function (api) {
  api.cache(true);

  const env = process.env.NODE_ENV || process.env.BABEL_ENV;

  const isDevelopment = env === 'development';
  const isProduction = env === 'production';
  const isTest = env === 'test';

  if (!['development', 'test', 'production'].includes(env)) {
    throw new Error(
      `Invalid environment: ${env}. Please use "development", "test", or "production".`
    );
  }

  return {
    presets: [
      isTest && [
        '@babel/preset-env',
        {
          targets: {
            node: 'current'
          }
        }
      ],
      (isProduction || isDevelopment) && [
        '@babel/preset-env',
        {
          bugfixes: true,
          useBuiltIns: 'usage',
          corejs: { version: 3, proposals: true },
          modules: false,
        }
      ]
    ].filter(Boolean),
    plugins: [
      'babel-plugin-macros',
      '@babel/plugin-syntax-dynamic-import',
      isTest && 'babel-plugin-dynamic-import-node',
      '@babel/plugin-transform-destructuring',
      ['@babel/plugin-transform-class-properties', { loose: true }],
      ['@babel/plugin-proposal-object-rest-spread', { useBuiltIns: true }],
      ['@babel/plugin-transform-private-methods', { loose: true }], // Updated plugin name
      ['@babel/plugin-transform-private-property-in-object', { loose: true }], // Updated plugin name
      ['@babel/plugin-transform-runtime', {
        regenerator: true,
        helpers: true,
      }],
    ].filter(Boolean)
  };
};
