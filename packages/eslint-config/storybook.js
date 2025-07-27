import {resolve} from 'node:path';
import {config as baseConfig} from './base.js';
import onlyWarn from 'eslint-plugin-only-warn';

const project = resolve(process.cwd(), 'tsconfig.json');

/** @type {import("eslint").Linter.Config} */
export const config = [
  ...baseConfig,
  {
    files: ['**/*.stories.tsx', '**/*.stories.ts', '**/*.mdx'],
    plugins: {
      'only-warn': onlyWarn,
    },
    languageOptions: {
      parserOptions: {
        project,
      },
      globals: {
        React: true,
        JSX: true,
      },
    },
    settings: {
      'import/resolver': {
        typescript: {
          project,
        },
      },
    },
    rules: {
      'import/no-default-export': 'off',
    },
  },
];
