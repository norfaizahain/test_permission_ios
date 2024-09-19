import { PluginListenerHandle,WebPlugin } from '@capacitor/core';

import type { testPermissionIosPlugin,GpsIsEnabled } from './definitions';
// import type { PluginListenerHandle } from '@capacitor/core';
export class testPermissionIosWeb
  extends WebPlugin
  implements testPermissionIosPlugin
{
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
  async isGpsEnabled(): Promise<GpsIsEnabled> {
    console.log("testing");
    const output = true;
    return output;
  }
  // async showEnableLocationAlert(options: { value: string; }):Promise<void>  {
  //   console.log('showEnableLocationAlert', options);
  //   // return options;
  // }
  async requestPermissions():Promise<void>{
    console.log("requestPermissions() from .ts customPlugin")
  }
  async addListener(eventName: string, listenerFunc: (info: any) => any): Promise<PluginListenerHandle> {
    console.log(`Listener registered for event: ${eventName}`);
    console.log(listenerFunc)
    // For web, simply return a listener handle
    const handle = { remove: async () => console.log(`Listener for ${eventName} removed`) };
    return Promise.resolve(handle);
  }
}
