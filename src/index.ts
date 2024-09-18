import { registerPlugin } from '@capacitor/core';

import type { testPermissionIosPlugin } from './definitions';

const testPermissionIos = registerPlugin<testPermissionIosPlugin>(
  'testPermissionIos',
  {
    web: () => import('./web').then(m => new m.testPermissionIosWeb()),
  },
);

export * from './definitions';
export { testPermissionIos };
