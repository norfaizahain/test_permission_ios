import { WebPlugin } from '@capacitor/core';

import type { testPermissionIosPlugin } from './definitions';

export class testPermissionIosWeb
  extends WebPlugin
  implements testPermissionIosPlugin
{
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
