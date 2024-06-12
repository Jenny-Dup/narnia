const babel = require('@babel/core')

module.exports = function (api) {
  api.cache(true); // Cache configuration for faster builds

  const env = process.env.NODE_ENV || process.env.BABEL_ENV; // Use both NODE_ENV and BABEL_ENV

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
          bugfixes: true, // Enable bugfix transforms
          useBuiltIns: 'usage',  // Polyfill only used features
          corejs: { version: 3, proposals: true },
          modules: false,
          // exclude: ['transform-typeof-symbol'] // Generally not needed
        }
      ]
    ].filter(Boolean),
    plugins: [
      'babel-plugin-macros',
      '@babel/plugin-syntax-dynamic-import',
      isTest && 'babel-plugin-dynamic-import-node',
      '@babel/plugin-transform-destructuring',
      ['@babel/plugin-proposal-class-properties', { loose: true }],
      ['@babel/plugin-proposal-object-rest-spread', { useBuiltIns: true }],
      ['@babel/plugin-proposal-private-methods', { loose: true }],
      ['@babel/plugin-proposal-private-property-in-object', { loose: true }],
      ['@babel/plugin-transform-runtime', {
        regenerator: true, // Use runtime for async/await
        helpers: true,     // Enable helper functions
      }],
      // ['@babel/plugin-transform-regenerator', { async: false }] // Not necessary with @babel/plugin-transform-runtime
    ].filter(Boolean)
  };
};
